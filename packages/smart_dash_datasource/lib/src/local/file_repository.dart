import 'package:optional/optional.dart';
import 'package:path/path.dart' as p;
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:universal_io/io.dart';

abstract class FileRepository<I, T> extends Repository<I, T>
    with BulkWriteRepositoryMixin {
  FileRepository(
    super.ref,
    this.dir,
    this.extension, {
    this.maxCount = 100,
    this.retention = Duration.zero,
  });

  final int maxCount;

  final Directory dir;

  final String extension;

  final Duration retention;

  int get count => getFileEntities().length;

  Future<T> read(File file);

  Future<bool> write(T item, File file);

  String toAbsolutePath(String key) => '${p.join(dir.path, key)}.$extension';

  File toFile(I id) {
    final key = toKey(id);
    return File(toAbsolutePath(key));
  }

  @override
  Future<bool> exists(I id) {
    return guard(
      () async {
        final file = toFile(id);
        return file.exists();
      },
      task: 'exists',
      name: '$FileRepository',
    );
  }

  @override
  Future<Optional<T>> get(I id) {
    return guard(
      () async {
        final file = toFile(id);
        if (!file.existsSync()) return const Optional.empty();
        return Optional.of(await read(file));
      },
      task: 'get',
      name: '$FileRepository',
    );
  }

  @override
  Future<SingleRepositoryResult<I, T>> upsert(T item) {
    try {
      return guard(
        () async {
          final created = <T>[];
          final updated = <T>[];
          final path = toKey(toId(item));
          final file = File(toAbsolutePath(path));
          if (!file.existsSync()) {
            file.createSync(recursive: true);
            created.add(item);
          }
          if (await write(item, file)) {
            if (!created.contains(item)) {
              updated.add(item);
            }
          }
          return raise(updated.isEmpty
              ? SingleRepositoryResult.created(item)
              : SingleRepositoryResult.updated(item));
        },
        task: 'addOrUpdate',
        name: '$runtimeType',
      );
    } finally {
      _compact();
    }
  }

  @override
  Future<SingleRepositoryResult<I, T>> remove(T item) {
    try {
      return guard(
        () async {
          final path = toKey(toId(item));
          final file = File(toAbsolutePath(path));
          if (file.existsSync()) {
            file.deleteSync();
            return raise(
              SingleRepositoryResult<I, T>.removed(item),
            );
          }
          return SingleRepositoryResult<I, T>.empty(item);
        },
        task: 'remove',
        name: '$runtimeType',
      );
    } finally {
      _compact();
    }
  }

  @override
  Future<List<T>> where(bool Function(T element) test) async {
    return (await getAll()).where(test).toList();
  }

  @override
  Future<List<T>> getAll([List<I> ids = const []]) {
    return guard(
      () async {
        final items = <T>[];
        final paths =
            ids.isEmpty ? getFileEntities().map((e) => e.path) : ids.map(toKey);
        for (final path in paths) {
          final file = File(toAbsolutePath(path));
          if (file.existsSync()) {
            final data = await read(file);
            items.add(data);
          }
        }
        return items;
      },
      task: 'getAll',
      name: '$runtimeType',
    );
  }

  @override
  Future<BulkRepositoryResult<I, T>> updateAll(Iterable<T> items) async {
    try {
      return guard(
        () async {
          final created = <T>[];
          final updated = <T>[];
          for (final it in items) {
            final path = toKey(toId(it));
            final file = File(toAbsolutePath(path));
            if (!file.existsSync()) {
              file.createSync(recursive: true);
              created.add(it);
            }
            if (await write(it, file)) {
              if (!created.contains(it)) {
                updated.add(it);
              }
            }
          }
          return raise(BulkRepositoryResult(
            created,
            updated,
            [],
          ));
        },
        task: 'updateAll',
        name: '$runtimeType',
      );
    } finally {
      _compact();
    }
  }

  @override
  Future<BulkRepositoryResult<I, T>> removeAll(Iterable<T> items) {
    return guard(
      () async {
        final deleted = <T>[];
        for (final it in items) {
          final path = toKey(toId(it));
          final file = File(toAbsolutePath(path));
          if (file.existsSync()) {
            file.deleteSync();
            deleted.add(it);
          }
        }
        return raise(
          BulkRepositoryResult<I, T>.removed(deleted),
        );
      },
      task: 'removeAll',
      name: '$runtimeType',
    );
  }

  List<File> getFiles() {
    final files = <File>[];
    for (final it in getFileEntities()) {
      files.add(File(p.join(dir.path, it.path)));
    }
    return files;
  }

  List<FileSystemEntity> getFileEntities() {
    return dir
        .listSync()
        .where((e) => p.extension(e.path) == extension)
        .toList();
  }

  Optional<DateTime> _compacted = const Optional.empty();

  @override
  Future<void> clear() async {
    final files = <File>[];
    final items = await getAll();
    for (final it in getFileEntities()) {
      files.add(File(p.join(dir.path, it.path)));
    }
    await Future.wait(files.map((e) => e.delete()));
    raise(
      BulkRepositoryResult<I, T>([], [], items),
    );
  }

  void _compact() {
    final now = DateTime.now();
    if (!_compacted.isPresent ||
        now.difference(_compacted.value).inHours > 1 ||
        count > maxCount) {
      compact();
      _compacted = Optional.of(now);
    }
  }

  int compact() {
    return guardSync(
      () {
        final now = DateTime.now();
        final deleted = <String>[];
        final items = getFileEntities()
            .map((e) => (e.path, e.statSync().changed))
            .toList();
        items.sort((a, b) => a.$2.compareTo(b.$2));
        if (retention > Duration.zero) {
          for (final it
              in items.where((e) => e.$2.difference(now) > retention)) {
            final path = it.$1;
            File(toAbsolutePath(path)).deleteSync();
            deleted.add(path);
          }
        }
        final remainder = items.length - deleted.length;
        if (remainder > maxCount) {
          final overflow = remainder - maxCount;
          final reminding = items.where((e) => deleted.contains(e.$1));
          for (final it in reminding.take(overflow)) {
            final path = it.$1;
            File(toAbsolutePath(path)).deleteSync();
            deleted.add(path);
          }
        }
        return deleted.length;
      },
      task: 'compact',
      name: '$runtimeType',
    );
  }
}
