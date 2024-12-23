import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:test/test.dart';

import 'connection_aware_repository_test.mocks.dart';

typedef FooEvent = RepositoryEvent<int, Foo>;
typedef SingleFooResult = SingleRepositoryResult<int, Foo>;

typedef FooState = RepositoryState<int, Foo>;
typedef FooStateEvent = RepositoryEvent<int, FooState>;
typedef SingleFooStateResult = SingleRepositoryResult<int, FooState>;

typedef FooRepository = Repository<int, Foo>;
typedef FooRemoteRepository = RemoteRepository<int, Foo>;
typedef ConnectionAwareFooRepository = ConnectionAwareRepository<int, Foo>;

@GenerateMocks([
  Dio,
  FooRepository,
  FooRemoteRepository,
])
void main() {
  _initLogger(Level.FINE);

  group('When ConnectionAwareRepository is [OFFLINE]', () {
    final local = MockFooRepository();
    final remote = MockFooRemoteRepository();
    late ConnectionAwareFooRepository repo;
    late Connectivity checker;

    setUp(() {
      checker = Connectivity.offline;
      repo = ConnectionAwareFooRepository(
        local: local,
        remote: remote,
        checker: checker,
      );
    });

    tearDown(() {
      reset(local);
      reset(remote);
    });

    test('then get item from local only', () async {
      // Arrange
      final item = _newFoo(1);
      final items = [item];
      final locals = items.map(FooState.local).toList();
      _mockLocalGetAll(local, [item]);
      _mockLocalGet(local, Optional.of(item));
      _mockLocalEvents(local, Stream.fromIterable([]));
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.get(item.id);

      // Assert
      await expectLater(result, completion(equals(locals)));
      await expectLater(repo.events, emitsInOrder([]));
      verify(local.get(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));
    });

    test('then get all items from local only', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final locals = items.map(FooState.local).toList();
      _mockLocalGetAll(local, items);
      _mockLocalEvents(local, Stream.fromIterable([]));
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.getAll();

      // Assert
      await expectLater(result, completion(equals(locals)));
      await expectLater(repo.events, emitsInOrder([]));
      verify(local.getAll(any));
      verifyNever(local.get(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));
    });

    test('then get given items from local only', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final item3 = _newFoo(3);
      final ids = [item1.id, item2.id];
      final items = [item1, item2, item3];
      final locals = items.map(FooState.local).toList();
      _mockLocalGetAll(local, items);
      _mockLocalEvents(local, Stream.fromIterable([]));
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.getAll(ids: ids);

      // Assert
      await expectLater(result, completion(equals(locals)));
      await expectLater(repo.events, emitsInOrder([]));
      verify(local.getAll(any));
      verifyNever(local.get(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));
    });

    test('then refresh does not fetch from remote', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final locals = items.map(FooState.local).toList();
      _mockLocalGetAll(local, items);
      _mockLocalEvents(local, Stream.fromIterable([]));
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.refresh();

      // Assert
      await expectLater(result, completion(equals(locals)));
      await expectLater(repo.events, emitsInOrder([]));
      verify(local.getAll(any)).called(equals(1));
      verifyNever(remote.getAll(any));
    });

    test('then new item is created locally only', () async {
      // Arrange
      final item = _newFoo(1);
      final expected = SingleFooStateResult.created(FooState.modified(item));
      final events = [
        FooStateEvent(expected),
      ];
      _mockLocalAddOrUpdate(
        local,
        SingleFooResult.created(item),
      );
      _mockLocalGetAll(local, []);
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.add(item);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, equals([item.id]));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, equals([item.id]));
      verify(local.get(any));
      verify(local.addOrUpdate(any));
      verifyNever(local.get(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.addOrUpdate(any));
    });

    test('then item is updated locally only', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final expected = SingleFooStateResult.updated(FooState.modified(item1v2));
      final events = [
        FooStateEvent(expected),
      ];
      _mockLocalAddOrUpdate(
        local,
        SingleFooResult.updated(item1v2),
        Optional.of(item1v1),
      );
      _mockLocalGetAll(local, []);
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.update(item1v2);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, equals([item1v2.id]));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, equals([item1v2.id]));
      verify(local.get(any));
      verify(local.addOrUpdate(any));
      verifyNever(local.exists(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.addOrUpdate(any));
    });

    test('then updating same item does nothing', () async {
      // Arrange
      final item = _newFoo(1);
      final expected = SingleFooStateResult.empty(
        FooState.local(item),
      );
      _mockLocalAddOrUpdate(
        local,
        SingleFooResult.empty(item),
        Optional.of(item),
      );
      _mockLocalGetAll(local, []);
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.update(item);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder([]));
      verify(local.get(any));
      verify(local.addOrUpdate(any));
      verifyNever(local.exists(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.addOrUpdate(any));
    });

    test('then item is removed locally only', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final expected = SingleFooStateResult.removed(FooState.modified(item1v2));
      final events = [
        FooStateEvent(expected),
      ];
      final localEvents = _mockLocalRemove(
        local,
        SingleFooResult.removed(item1v2),
        Optional.of(item1v1),
      );
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.remove(item1v2);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, equals([item1v2.id]));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, equals([item1v2.id]));
      verify(local.remove(any));
      verifyNever(local.get(any));
      verifyNever(local.exists(any));
      verifyNever(local.getAll(any));
      verifyNever(remote.get(any));
      verifyNever(remote.remove(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
    });

    test('then modifications are committed when online', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final localEvent =
          SingleFooStateResult.removed(FooState.modified(item1v2));
      final remoteEvent =
          SingleFooStateResult.removed(FooState.remote(item1v2));
      final events = [
        FooStateEvent(localEvent),
        FooStateEvent(remoteEvent),
      ];
      final localEvents = _mockLocalRemove(
        local,
        SingleFooResult.removed(item1v2),
        Optional.of(item1v1),
      );
      final remoteEvents = _mockRemoteRemove(
        remote,
        SingleFooResult.removed(item1v2),
        Optional.of(item1v1),
      );

      // Apply
      final result = repo.remove(item1v2);
      checker.set(ConnectivityStatus.online, false);

      // Assert
      await expectLater(result, completion(equals(localEvent)));
      expect(repo.modified, equals([item1v2.id]));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.remove(any));
      verify(remote.remove(any));
      verifyNever(local.get(any));
      verifyNever(local.exists(any));
      verifyNever(local.getAll(any));
      verifyNever(remote.get(any));
      verifyNever(local.exists(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });
  });

  group('When ConnectionAwareRepository is [ONLINE]', () {
    final local = MockFooRepository();
    final remote = MockFooRemoteRepository();
    late ConnectionAwareRepository<int, Foo> repo;
    late Connectivity checker;

    setUp(() {
      checker = Connectivity.online;
      repo = ConnectionAwareRepository(
        local: local,
        remote: remote,
        checker: checker,
      );
    });

    tearDown(() {
      reset(local);
      reset(remote);
    });

    test('then get new item from remote', () async {
      // Arrange
      final item = _newFoo(1);
      final localState = FooState.local(item);
      final localResult = SingleFooStateResult.created(localState);
      final events = [
        FooStateEvent(localResult),
      ];
      final localEvents = _mockLocalAddOrUpdate(
        local,
        SingleFooResult.created(item),
      );
      final remoteEvents = _mockRemoteGet(remote, item, false);
      _mockRemoteEvents(remote, remoteEvents.stream);

      // Apply
      final result = repo.get(item.id);

      // Assert
      await expectLater(result, completion(equals(Optional.empty())));
      await expectLater(repo.events, emitsInOrder(events));
      verify(local.get(any));
      verify(local.addOrUpdate(any));
      verify(remote.get(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then get updated item from remote', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final localState1v1 = FooState.local(item1v1);
      final localState1v2 = FooState.local(item1v2);
      final events = [
        FooStateEvent(SingleFooStateResult.updated(localState1v2)),
      ];
      final localEvents = _mockLocalAddOrUpdateBuilder(
        local,
        exists: (invocation) => true,
        result: (invocation) {
          return SingleFooResult.updated(invocation.itemOrDefault(item1v1));
        },
      );
      final remoteEvents = _mockRemoteGet(
        remote,
        item1v2,
        false,
      );
      _mockRemoteEvents(remote, remoteEvents.stream);

      // Apply
      final result = repo.get(item1v1.id);

      // Assert
      await expectLater(result, completion(equals(Optional.of(localState1v1))));
      await expectLater(repo.events, emitsInOrder(events));
      verify(local.get(any));
      verify(local.addOrUpdate(any));
      verify(remote.get(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then get all items from remote', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final events = [
        FooStateEvent(SingleFooStateResult.empty(FooState.local(item1))),
        FooStateEvent(SingleFooStateResult.empty(FooState.local(item2))),
      ];
      _mockLocalGetAll(local, []);
      final localEvents = _mockLocalAddOrUpdateBuilder(local,
          exists: (invocation) => true,
          result: (invocation) {
            return SingleFooResult.empty(invocation.itemOrDefault(item1));
          });
      final remoteEvents = _mockRemoteGetAll(remote, items, false);
      _mockRemoteEvents(remote, remoteEvents.stream);

      // Apply
      final result = repo.getAll();

      // Assert
      await expectLater(result, completion(equals([])));
      await expectLater(repo.events, emitsInOrder(events));
      verify(local.getAll(any));
      verify(remote.getAll(any));
      verifyNever(local.get(any));
      verifyNever(remote.get(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then get given items from remote', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final item3 = _newFoo(3);
      final ids = [item1.id, item2.id];
      final items = [item1, item2, item3];
      final events = [
        FooStateEvent(SingleFooStateResult.empty(FooState.local(item1))),
        FooStateEvent(SingleFooStateResult.empty(FooState.local(item2))),
      ];
      _mockLocalGetAll(local, []);
      final localEvents = _mockLocalAddOrUpdateBuilder(local,
          exists: (invocation) => true,
          result: (invocation) {
            return SingleFooResult.empty(invocation.itemOrDefault(item1));
          });
      final remoteEvents = _mockRemoteGetAll(remote, items, false);
      _mockRemoteEvents(remote, remoteEvents.stream);

      // Apply
      final result = repo.getAll(ids: ids);

      // Assert
      await expectLater(result, completion(equals([])));
      await expectLater(repo.events, emitsInOrder(events));
      verify(local.getAll(any));
      verify(remote.getAll(any));
      verifyNever(local.get(any));
      verifyNever(remote.get(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then new item is created remotely', () async {
      // Arrange
      final item = _newFoo(1);
      final localResult = SingleFooStateResult.created(FooState.modified(item));
      final remoteResult = SingleFooStateResult.created(FooState.remote(item));
      final events = [
        FooStateEvent(localResult),
        FooStateEvent(remoteResult),
      ];
      final localEvents = _mockLocalAddOrUpdate(
        local,
        SingleFooResult.created(item),
      );
      final remoteEvents = _mockRemoteAddOrUpdate(
        remote,
        SingleFooResult.created(item),
      );

      // Apply
      final result = repo.add(item);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.get(any));
      verify(remote.get(any));
      verify(local.addOrUpdate(any));
      verify(remote.addOrUpdate(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then item is updated remotely', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final localResult = SingleFooStateResult.updated(
        FooState.modified(item1v2),
      );
      final remoteResult = SingleFooStateResult.updated(
        FooState.remote(item1v2),
      );
      final events = [
        FooStateEvent(localResult),
        FooStateEvent(remoteResult),
      ];
      final localEvents = _mockLocalAddOrUpdate(
        local,
        SingleFooResult.updated(item1v2),
        Optional.of(item1v1),
      );
      final remoteEvents = _mockRemoteAddOrUpdate(
        remote,
        SingleFooResult.updated(item1v2),
        Optional.of(item1v1),
      );

      // Apply
      final result = repo.update(item1v2);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      expect(repo.modified, equals([item1v2.id]));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.get(any));
      verify(remote.get(any));
      verify(local.addOrUpdate(any));
      verify(remote.addOrUpdate(any));
      verifyNever(local.exists(any));
      verifyNever(local.getAll(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then updating same item does nothing', () async {
      // Arrange
      final item = _newFoo(1);
      final expected = SingleFooStateResult.empty(
        FooState.local(item),
      );
      final localEvents = _mockLocalAddOrUpdate(
        local,
        SingleFooResult.empty(item),
        Optional.of(item),
      );
      final remoteEvents = _mockRemoteAddOrUpdate(
        remote,
        SingleFooResult.empty(item),
        Optional.of(item),
      );

      // Apply
      final result = repo.update(item);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder([]));
      verify(local.get(any));
      verify(remote.get(any));
      verify(local.addOrUpdate(any));
      verifyNever(local.exists(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.addOrUpdate(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then item is removed remotely', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final localResult =
          SingleFooStateResult.removed(FooState.modified(item1v2));
      final remoteResult =
          SingleFooStateResult.removed(FooState.remote(item1v2));
      final events = [
        FooStateEvent(localResult),
        FooStateEvent(remoteResult),
      ];
      final localEvents = _mockLocalRemove(
        local,
        SingleFooResult.removed(item1v2),
        Optional.of(item1v1),
      );
      final remoteEvents = _mockRemoteRemove(
        remote,
        SingleFooResult.removed(item1v2),
        Optional.of(item1v1),
      );

      // Apply
      final result = repo.remove(item1v2);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      expect(repo.modified, equals([item1v2.id]));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.remove(any));
      verify(remote.remove(any));
      verifyNever(local.get(any));
      verifyNever(local.exists(any));
      verifyNever(local.getAll(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });
  });
}

// ==========================================
// LOCAL Repository Mocking Methods
// ==========================================

StreamController<SingleFooResult> _mockLocalAddOrUpdate(
  MockFooRepository mockRepo,
  SingleFooResult result, [
  Optional<Foo> existing = const Optional.empty(),
]) {
  return _mockLocalAddOrUpdateBuilder(
    mockRepo,
    result: (invocation) => result,
    exists: (invocation) => existing.isPresent,
  );
}

StreamController<SingleFooResult> _mockLocalAddOrUpdateBuilder(
  MockFooRepository mockRepo, {
  required bool Function(Invocation invocation) exists,
  required SingleFooResult Function(Invocation invocation) result,
}) {
  provideDummyBuilder<SingleFooResult>((parent, invocation) {
    return result(invocation);
  });

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => invocation.item.value.id,
  );

  when(mockRepo.exists(any)).thenAnswer(
    (invocation) async => exists(invocation),
  );

  when(mockRepo.get(any)).thenAnswer(
    (invocation) async {
      return exists(invocation)
          ? Optional.of(result(invocation).item)
          : Optional.empty();
    },
  );

  final controller = StreamController<SingleFooResult>();
  when(mockRepo.addOrUpdate(any)).thenAnswer(
    (invocation) async {
      final r = result(invocation);
      controller.add(r);
      return r;
    },
  );
  when(mockRepo.events).thenAnswer(
    (_) => controller.stream.map(
      (e) => FooEvent(e),
    ),
  );
  return controller;
}

StreamController<SingleFooResult> _mockLocalRemove(
  MockFooRepository mockRepo,
  SingleFooResult result, [
  Optional<Foo> existing = const Optional.empty(),
]) {
  provideDummy<SingleFooResult>(result);

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => result.item.id,
  );

  _mockLocalExists(
    mockRepo,
    [if (existing.isPresent) existing.value],
  );

  when(mockRepo.get(any)).thenAnswer(
    (invocation) async {
      return existing;
    },
  );

  final controller = StreamController<SingleFooResult>();
  when(mockRepo.remove(any)).thenAnswer(
    (invocation) async {
      controller.add(result);
      return result;
    },
  );
  when(mockRepo.events).thenAnswer(
    (_) => controller.stream.map(
      (e) => FooEvent(e),
    ),
  );
  return controller;
}

void _mockLocalExists(MockFooRepository mockRepo, List<Foo> items) {
  when(mockRepo.exists(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as int;
    return items.any(
      (e) => e.id == id,
    );
  });
}

void _mockLocalGet(MockFooRepository mockRepo, Optional<Foo> item) {
  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => item.value.id,
  );
  when(mockRepo.get(any)).thenAnswer((_) async => item);
}

void _mockLocalGetAll(MockFooRepository mockRepo, List<Foo> items) {
  when(mockRepo.getAll(any)).thenAnswer((_) async => items);
}

void _mockLocalEvents(
  MockFooRepository mockRepo,
  Stream<Foo> items,
) {
  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => invocation.item.value.id,
  );
  when(mockRepo.events).thenAnswer(
    (_) => items.map(
      (e) => FooEvent(
        SingleFooResult(e, false, false, false),
      ),
    ),
  );
}

// ==========================================
// REMOTE Repository Mocking Methods
// ==========================================

StreamController<SingleFooResult> _mockRemoteAddOrUpdate(
  MockFooRemoteRepository mockRepo,
  SingleFooResult result, [
  Optional<Foo> existing = const Optional.empty(),
]) {
  provideDummy<SingleFooResult>(result);

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => result.item.id,
  );

  when(mockRepo.get(any)).thenAnswer(
    (invocation) async {
      return existing;
    },
  );

  final controller = StreamController<SingleFooResult>();
  when(mockRepo.addOrUpdate(any)).thenAnswer(
    (invocation) async {
      controller.add(result);
      return result;
    },
  );
  when(mockRepo.events).thenAnswer(
    (_) => controller.stream.map(
      (e) => FooEvent(e),
    ),
  );
  when(mockRepo.getAll(any)).thenAnswer((_) async => [result.item]);
  return controller;
}

StreamController<SingleFooResult> _mockRemoteRemove(
  MockFooRemoteRepository mockRepo,
  SingleFooResult result, [
  Optional<Foo> existing = const Optional.empty(),
]) {
  provideDummy<SingleFooResult>(result);

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => result.item.id,
  );

  _mockRemoteExists(
    mockRepo,
    [if (existing.isPresent) existing.value],
  );

  when(mockRepo.get(any)).thenAnswer(
    (invocation) async {
      return existing;
    },
  );

  final controller = StreamController<SingleFooResult>();
  when(mockRepo.remove(any)).thenAnswer(
    (invocation) async {
      controller.add(result);
      return result;
    },
  );

  when(mockRepo.events).thenAnswer(
    (_) => controller.stream.map(
      (e) => FooEvent(e),
    ),
  );
  return controller;
}

void _mockRemoteExists(MockFooRemoteRepository mockRepo, List<Foo> items) {
  when(mockRepo.exists(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as int;
    return items.any(
      (e) => e.id == id,
    );
  });
}

StreamController<Foo> _mockRemoteGet(
  MockFooRemoteRepository mockRepo,
  Foo item, [
  bool emit = true,
]) {
  final controller = StreamController<Foo>();
  when(mockRepo.get(any)).thenAnswer((_) async {
    if (emit) {
      controller.addStream(Stream.fromIterable([item]));
    }
    return Optional.of(item);
  });
  return controller;
}

StreamController<Foo> _mockRemoteGetAll(
  MockFooRemoteRepository mockRepo,
  List<Foo> items, [
  bool emit = true,
]) {
  final controller = StreamController<Foo>();
  when(mockRepo.getAll(any)).thenAnswer((_) async {
    if (emit) {
      controller.addStream(Stream.fromIterable(items));
    }
    return items;
  });
  return controller;
}

void _mockRemoteEvents(
  MockFooRemoteRepository mockRepo,
  Stream<Foo> items,
) {
  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => invocation.item.value.id,
  );
  when(mockRepo.events).thenAnswer(
    (_) => items.map(
      (e) => FooEvent(
        SingleFooResult(e, false, false, false),
      ),
    ),
  );
}

Foo _newFoo(int id, [String? value]) {
  return Foo(id, value ?? id.toString());
}

void _initLogger(Level level) {
  Logger.root.level = level;

  Logger.root.onRecord.listen((record) {
    // TODO: Store logs locally with hive
    print([
      record.time,
      record.level.name,
      record.loggerName,
      record.message,
      [
        if (record.error != null) record.error,
        if (record.stackTrace != null) record.stackTrace,
      ].join('\n'),
    ].where((e) => e.toString().isNotEmpty == true).join(': '));
  });
}

class Foo {
  final int id;
  final String value;

  Foo(this.id, this.value);

  @override
  String toString() {
    return 'Foo{id: $id, value: $value}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Foo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          value == other.value;

  @override
  int get hashCode => id.hashCode ^ value.hashCode;
}

extension InvocationX on Invocation {
  Optional<Foo> get item {
    if (positionalArguments.isEmpty || positionalArguments.first is! Foo) {
      return Optional<Foo>.empty();
    }
    return Optional.of(positionalArguments.first as Foo);
  }

  Foo itemOrDefault(Foo defaultValue) {
    if (positionalArguments.isEmpty || positionalArguments.first is! Foo) {
      return defaultValue;
    }
    return positionalArguments.first as Foo;
  }
}
