import 'dart:async';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:test/test.dart';

import 'bulk_connection_aware_repository_test.mocks.dart';

typedef FooEvent = RepositoryEvent<int, Foo>;
typedef BulkFooResult = BulkRepositoryResult<int, Foo>;
typedef FooResult = RepositoryResult<int, Foo>;
typedef SingleFooResult = SingleRepositoryResult<int, Foo>;

typedef FooState = RepositoryState<int, Foo>;
typedef FooStateEvent = RepositoryEvent<int, FooState>;
typedef BulkFooStateResult = BulkRepositoryResult<int, FooState>;
typedef SingleFooStateResult = SingleRepositoryResult<int, FooState>;

typedef BulkFooRepository = BulkWriteRepositoryMixin<int, Foo>;
typedef BulkFooRemoteRepository = BulkRemoteRepositoryMixin<int, Foo, Foo>;
typedef BulkConnectionAwareFooRepository
    = BulkConnectionAwareRepository<int, Foo, Foo>;

@GenerateMocks([
  Dio,
  BulkFooRepository,
  BulkFooRemoteRepository,
])
void main() {
  _initLogger(Level.FINE);

  group('When BulkConnectionAwareRepository is [OFFLINE]', () {
    final local = MockBulkFooRepository();
    final remote = MockBulkFooRemoteRepository();
    late BulkConnectionAwareFooRepository repo;
    late Connectivity checker;

    setUp(() {
      checker = Connectivity.offline;
      repo = BulkConnectionAwareFooRepository(
        local: local,
        remote: remote,
        checker: checker,
      );
    });

    tearDown(() {
      reset(local);
      reset(remote);
    });

    test('then get items from local only', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final ids = [item1.id, item2.id];
      final locals = items.map(FooState.local).toList();
      _mockLocalGetAll(local, items);
      _mockLocalGet(local, Optional.of(item1));
      _mockLocalEvents(local, Stream.fromIterable([]));
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.getAll(ids: ids);

      // Assert
      await expectLater(result, completion(equals(locals)));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder([]));
      expect(repo.modified, isEmpty);
      verify(local.getAll(any));
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

    test('then new items are created locally only', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final ids = [item1.id, item2.id];
      final expected = BulkFooStateResult.created([
        FooState.modified(item1),
        FooState.modified(item2),
      ]);
      final events = [FooStateEvent(expected)];
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.created(items),
      );
      _mockLocalGetAll(local, []);
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.updateAll(items);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, equals(ids));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, equals(ids));
      verify(local.updateAll(any));
      verifyNever(local.get(any));
      verifyNever(local.get(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
    });

    test('then items are updated locally only', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final item2v1 = _newFoo(2, 'v1');
      final item2v2 = _newFoo(2, 'v2');
      final items = [item1v2, item2v2];
      final ids = [item1v2.id, item2v2.id];
      final expected = BulkFooStateResult.updated([
        FooState.modified(item1v2),
        FooState.modified(item2v2),
      ]);
      final events = [
        FooStateEvent(expected),
      ];
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.updated(items),
      );
      _mockLocalGetAll(local, [item1v1, item2v1]);
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.updateAll(items);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, equals(ids));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, equals(ids));
      verify(local.updateAll(any));
      verifyNever(local.get(any));
      verifyNever(local.exists(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
    });

    test('then updating same items does nothing', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final expected = BulkFooStateResult.empty();
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.empty(),
      );
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.updateAll(items);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder([]));
      expect(repo.modified, isEmpty);
      verify(local.updateAll(any));
      verifyNever(local.getAll(any));
      verifyNever(local.exists(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
    });

    test('then items are removed locally only', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final ids = [item1.id, item2.id];
      final expected = BulkFooStateResult.removed(
        [
          FooState.modified(item1),
          FooState.modified(item2),
        ],
      );
      final events = [
        FooStateEvent(expected),
      ];
      final localEvents = _mockLocalRemoveAll(
        local,
        BulkFooResult.removed(items),
      );
      _mockRemoteEvents(remote, Stream.fromIterable([]));

      // Apply
      final result = repo.removeAll(items);

      // Assert
      await expectLater(result, completion(equals(expected)));
      expect(repo.modified, equals(ids));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, equals(ids));
      verify(local.removeAll(any));
      verifyNever(local.get(any));
      verifyNever(local.exists(any));
      verifyNever(local.getAll(any));
      verifyNever(remote.get(any));
      verifyNever(remote.getAll(any));

      // Cleanup
      localEvents.close();
    });

    test('then modifications are committed when online', () async {
      // Arrange
      final item1 = _newFoo(1); // Update
      final item2 = _newFoo(2); //
      final items = [item1, item2]; // Create
      final ids = [item1.id, item2.id]; // Create
      final localResult = BulkFooStateResult(
        [FooState.modified(item1)],
        [FooState.modified(item2)],
        [],
      );
      final remoteResult = BulkFooStateResult(
        [FooState.remote(item1)],
        [FooState.remote(item2)],
        [],
      );
      final events = [
        FooStateEvent(localResult),
        FooStateEvent(remoteResult),
      ];
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult(
          [item1],
          [item2],
          [],
        ),
      );
      final remoteEvents = _mockRemoteUpdateAll(
        remote,
        BulkFooResult(
          [item1],
          [item2],
          [],
        ),
      );

      // Apply
      final result = repo.updateAll(items);
      checker.set(ConnectivityStatus.online, false);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      expect(repo.modified, equals(ids));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.updateAll(any));
      verify(remote.updateAll(any));
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

  group('When BulkConnectionAwareRepository is [ONLINE]', () {
    final local = MockBulkFooRepository();
    final remote = MockBulkFooRemoteRepository();
    late BulkConnectionAwareRepository<int, Foo, Foo> repo;
    late Connectivity checker;

    setUp(() {
      checker = Connectivity.online;
      repo = BulkConnectionAwareRepository(
        local: local,
        remote: remote,
        checker: checker,
      );
    });

    tearDown(() {
      reset(local);
      reset(remote);
    });

    test('then get new items from remote', () async {
      // Arrange

      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final ids = [item1.id, item2.id];
      final localResult = BulkFooStateResult.created(
        items.map(FooState.local),
      );
      final events = [
        FooStateEvent(localResult),
      ];
      _mockLocalGetAll(local, []);
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.created(items),
      );
      _mockLocalRemoveAll(
        local,
        BulkFooResult.empty(),
        eventController: localEvents,
      );
      final remoteEvents = _mockRemoteGetAll(
        remote,
        items,
        false,
      );
      _mockRemoteEvents(remote, remoteEvents.stream);

      // Apply
      final result = repo.getAll(ids: ids);

      // Assert
      await expectLater(result, completion(equals([])));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.getAll(any));
      verify(local.updateAll(any));
      verify(local.removeAll(any));
      verify(remote.getAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then get updated items from remote', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final item2v1 = _newFoo(2, 'v1');
      final item2v2 = _newFoo(2, 'v2');
      final items = [item1v2, item2v2];
      final ids = [item1v1.id, item2v1.id];
      final localState1v1 = FooState.local(item1v1);
      final localState1v2 = FooState.local(item1v2);
      final localState2v1 = FooState.local(item2v1);
      final localState2v2 = FooState.local(item2v2);
      final localStates = [localState1v1, localState2v1];
      final events = [
        FooStateEvent(BulkFooStateResult.updated(
          [localState1v2, localState2v2],
        )),
      ];
      _mockLocalGetAll(local, [item1v1, item2v1]);
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.updated(items),
      );
      _mockLocalRemoveAll(
        local,
        BulkFooResult.empty(),
        eventController: localEvents,
      );
      final remoteEvents = _mockRemoteGetAll(
        remote,
        items,
        false,
      );
      _mockRemoteEvents(remote, remoteEvents.stream);

      // Apply
      final result = repo.getAll(ids: ids);

      // Assert
      await expectLater(result, completion(equals(localStates)));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.getAll(any));
      verify(local.updateAll(any));
      verify(local.removeAll(any));
      verify(remote.getAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then get all items from remote', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final ids = [item1.id, item2.id];
      final localState1 = FooState.local(item1);
      final localState2 = FooState.local(item2);
      final localStates = [localState1, localState2];
      final events = [
        FooStateEvent(
          BulkFooStateResult.updated(localStates),
        ),
      ];
      _mockLocalGetAll(local, items);
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.updated(items),
      );
      _mockLocalRemoveAll(
        local,
        BulkFooResult.empty(),
        eventController: localEvents,
      );
      final remoteEvents = _mockRemoteGetAll(
        remote,
        items,
        false,
      );
      _mockRemoteEvents(remote, remoteEvents.stream);

      // Apply
      final result = repo.getAll(ids: ids);

      // Assert
      await expectLater(result, completion(equals(localStates)));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.getAll(any));
      verify(local.updateAll(any));
      verify(local.removeAll(any));
      verify(remote.getAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then new items are created remotely', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final items = [item1, item2];
      final ids = [item1.id, item2.id];
      final localResult = BulkFooStateResult.created(
        items.map(FooState.modified),
      );
      final remoteResult = BulkFooStateResult.created(
        items.map(FooState.modified),
      );
      final events = [
        FooStateEvent(remoteResult),
      ];
      _mockLocalGetAll(local, []);
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.created(items),
      );
      _mockLocalRemoveAll(
        local,
        BulkFooResult.created(items),
        eventController: localEvents,
      );
      _mockRemoteGetAll(remote, [], false);
      final remoteEvents = _mockRemoteUpdateAll(
        remote,
        BulkFooResult.created(items),
      );
      _mockRemoteRemoveAll(
        remote,
        BulkFooResult.empty(),
        eventController: remoteEvents,
      );

      // Apply
      final result = repo.updateAll(items);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      expect(repo.modified, equals(ids));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.updateAll(any));
      verify(remote.updateAll(any));
      verifyNever(local.getAll(any));
      verifyNever(local.removeAll(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.removeAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then items are updated remotely', () async {
      // Arrange
      final item1v1 = _newFoo(1, 'v1');
      final item1v2 = _newFoo(1, 'v2');
      final item2v1 = _newFoo(2, 'v1');
      final item2v2 = _newFoo(2, 'v2');
      final locals = [item1v1, item2v1];
      final remotes = [item1v2, item2v2];
      final ids = [item1v1.id, item2v1.id];
      final localResult = BulkFooStateResult.updated(
        locals.map(FooState.modified),
      );
      final remoteResult = BulkFooStateResult.updated(
        remotes.map(FooState.remote),
      );
      final events = [
        FooStateEvent(localResult),
        FooStateEvent(remoteResult),
      ];
      _mockLocalGetAll(local, locals);
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.updated(locals),
      );
      _mockLocalRemoveAll(
        local,
        BulkFooResult.empty(),
        eventController: localEvents,
      );
      _mockRemoteGetAll(remote, remotes, false);
      final remoteEvents = _mockRemoteUpdateAll(
        remote,
        BulkFooResult.updated(remotes),
      );
      _mockRemoteRemoveAll(
        remote,
        BulkFooResult.empty(),
        eventController: remoteEvents,
      );

      // Apply
      final result = repo.updateAll(locals);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      expect(repo.modified, equals(ids));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.updateAll(any));
      verify(remote.updateAll(any));
      verifyNever(local.getAll(any));
      verifyNever(local.removeAll(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.removeAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then updating same items does nothing', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final locals = [item1, item2];
      final remotes = [item1, item2];
      final localResult = BulkFooStateResult.empty();
      final events = [];
      _mockLocalGetAll(local, locals);
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.empty(),
      );
      _mockLocalRemoveAll(
        local,
        BulkFooResult.empty(),
        eventController: localEvents,
      );
      _mockRemoteGetAll(remote, remotes, false);
      final remoteEvents = _mockRemoteUpdateAll(
        remote,
        BulkFooResult.empty(),
      );
      _mockRemoteRemoveAll(
        remote,
        BulkFooResult.empty(),
        eventController: remoteEvents,
      );

      // Apply
      final result = repo.updateAll(locals);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      expect(repo.modified, isEmpty);
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.updateAll(any));
      verifyNever(local.getAll(any));
      verifyNever(local.removeAll(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.updateAll(any));
      verifyNever(remote.removeAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });

    test('then items are removed remotely', () async {
      // Arrange
      final item1 = _newFoo(1);
      final item2 = _newFoo(2);
      final locals = [item1, item2];
      final remotes = [item1, item2];
      final ids = [item1.id, item2.id];
      final localResult = BulkFooStateResult.removed(
        locals.map(FooState.modified),
      );
      final remoteResult = BulkFooStateResult.removed(
        remotes.map(FooState.remote),
      );
      final events = [
        FooStateEvent(localResult),
        FooStateEvent(remoteResult),
      ];
      _mockLocalGetAll(local, locals);
      final localEvents = _mockLocalUpdateAll(
        local,
        BulkFooResult.empty(),
      );
      _mockLocalRemoveAll(
        local,
        BulkFooResult.removed(locals),
        eventController: localEvents,
      );
      _mockRemoteGetAll(remote, remotes, false);
      final remoteEvents = _mockRemoteUpdateAll(
        remote,
        BulkFooResult.empty(),
      );
      _mockRemoteRemoveAll(
        remote,
        BulkFooResult.removed(remotes),
        eventController: remoteEvents,
      );

      // Apply
      final result = repo.removeAll(locals);

      // Assert
      await expectLater(result, completion(equals(localResult)));
      expect(repo.modified, equals(ids));
      await expectLater(repo.events, emitsInOrder(events));
      expect(repo.modified, isEmpty);
      verify(local.removeAll(any));
      verify(remote.removeAll(any));
      verifyNever(local.getAll(any));
      verifyNever(local.updateAll(any));
      verifyNever(remote.getAll(any));
      verifyNever(remote.updateAll(any));

      // Cleanup
      localEvents.close();
      remoteEvents.close();
    });
  });
}

// ==========================================
// LOCAL Repository Mocking Methods
// ==========================================

StreamController<FooResult> _mockLocalUpdateAll(
  MockBulkFooRepository mockRepo,
  BulkFooResult result, {
  Optional<Foo> existing = const Optional.empty(),
  StreamController<FooResult>? eventController,
}) {
  return _mockLocalUpdateAllBuilder(
    mockRepo,
    result: (invocation) => result,
    exists: (invocation) => existing.isPresent,
    eventController: eventController,
  );
}

StreamController<FooResult> _mockLocalUpdateAllBuilder(
  MockBulkFooRepository mockRepo, {
  required bool Function(Invocation invocation) exists,
  required BulkFooResult Function(Invocation invocation) result,
  StreamController<FooResult>? eventController,
}) {
  provideDummyBuilder<BulkFooResult>((parent, invocation) {
    return result(invocation);
  });

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => invocation.item.value.id,
  );

  final controller = eventController ?? StreamController<BulkFooResult>();
  when(mockRepo.updateAll(any)).thenAnswer(
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

StreamController<FooResult> _mockLocalRemoveAll(
  MockBulkFooRepository mockRepo,
  BulkFooResult result, {
  Optional<Foo> existing = const Optional.empty(),
  StreamController<FooResult>? eventController,
}) {
  provideDummy<BulkFooResult>(result);

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => invocation.item.value.id,
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

  final controller = eventController ?? StreamController<FooResult>();
  when(mockRepo.removeAll(any)).thenAnswer(
    (invocation) async {
      if (result.isNotEmpty) {
        controller.add(result);
      }
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

void _mockLocalExists(MockBulkFooRepository mockRepo, List<Foo> items) {
  when(mockRepo.exists(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as int;
    return items.any(
      (e) => e.id == id,
    );
  });
}

void _mockLocalGet(MockBulkFooRepository mockRepo, Optional<Foo> item) {
  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => item.value.id,
  );
  when(mockRepo.get(any)).thenAnswer((_) async => item);
}

void _mockLocalGetAll(MockBulkFooRepository mockRepo, List<Foo> items) {
  when(mockRepo.getAll(any)).thenAnswer((_) async => items);
}

void _mockLocalEvents(
  MockBulkFooRepository mockRepo,
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

StreamController<FooResult> _mockRemoteUpdateAll(
  MockBulkFooRemoteRepository mockRepo,
  BulkFooResult result, {
  Optional<Foo> existing = const Optional.empty(),
  StreamController<FooResult>? eventController,
}) {
  return _mockRemoteUpdateAllBuilder(
    mockRepo,
    result: (invocation) => result,
    exists: (invocation) => existing.isPresent,
    eventController: eventController,
  );
}

StreamController<FooResult> _mockRemoteUpdateAllBuilder(
  MockBulkFooRemoteRepository mockRepo, {
  required bool Function(Invocation invocation) exists,
  required BulkFooResult Function(Invocation invocation) result,
  StreamController<FooResult>? eventController,
}) {
  provideDummyBuilder<BulkFooResult>((parent, invocation) {
    return result(invocation);
  });

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => invocation.item.value.id,
  );

  final controller = eventController ?? StreamController<BulkFooResult>();
  when(mockRepo.updateAll(any)).thenAnswer(
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

StreamController<FooResult> _mockRemoteRemoveAll(
  MockBulkFooRemoteRepository mockRepo,
  BulkFooResult result, {
  Optional<Foo> existing = const Optional.empty(),
  StreamController<FooResult>? eventController,
}) {
  provideDummy<BulkFooResult>(result);

  when(mockRepo.toId(any)).thenAnswer(
    (invocation) => invocation.item.value.id,
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

  final controller = eventController ?? StreamController<FooResult>();
  when(mockRepo.removeAll(any)).thenAnswer(
    (invocation) async {
      if (result.isNotEmpty) {
        controller.add(result);
      }
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

void _mockRemoteExists(MockBulkFooRemoteRepository mockRepo, List<Foo> items) {
  when(mockRepo.exists(any)).thenAnswer((args) async {
    final id = args.positionalArguments.first as int;
    return items.any(
      (e) => e.id == id,
    );
  });
}

StreamController<Foo> _mockRemoteGetAll(
  MockBulkFooRemoteRepository mockRepo,
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
  MockBulkFooRemoteRepository mockRepo,
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
