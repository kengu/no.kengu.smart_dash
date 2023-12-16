import 'dart:convert';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dart_appwrite/models.dart';
import 'package:smart_dash_backend/device_driver/domain/device.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_backend/device_driver/domain/energy_summary.dart';
import 'package:smart_dash_backend/util/json.dart';

class DeviceRepository {
  DeviceRepository(this.client);

  static const databaseId = 'devices';
  static const collectionId = 'paired';

  final Client client;

  Future<Optional<Device>> get(String key, String id) async {
    final devices = await select(key: key, ids: [id]);
    return devices.firstOptional;
  }

  Future<List<Device>> select({
    String? key,
    String? type,
    List<String> ids = const [],
  }) async {
    final databases = Databases(client);
    final devices = await databases.listDocuments(
        databaseId: databaseId,
        collectionId: collectionId,
        queries: [
          if (key != null) Query.equal('key', key),
          if (ids.isNotEmpty) Query.equal('id', ids),
          if (type != null) Query.equal('type', type),
        ]);
    return devices.documents.map((e) => e.data).map(fromJson).toList();
  }

  Device fromJson(Map<String, dynamic> data) => Device.fromJson(data).copyWith(
        data: jsonDecode(data['dataAsJson']) as JsonObject,
        energy: data['energyAsJson'] != null
            ? EnergySummary.fromJson(
                jsonDecode(data['energyAsJson']) as JsonObject,
              )
            : null,
      );

  /// Attempt to add all given devices to
  /// repository. Returns list of actual added devices.
  Future<List<Device>> addAll(String key, Iterable<Device> devices) async {
    final changed = <Device>[];
    final candidates = devices.toSet().toList();
    final current = await select(
      key: key,
      ids: candidates.map((e) => e.id).toList(),
    );
    final ids = current.map((e) => e.id).toList();
    changed.addAll(await _insert(
      key,
      candidates.toList()..removeWhere((e) => ids.contains(e.id)),
    ));
    changed.addAll(await _update(
      key,
      candidates.toList()..retainWhere((e) => ids.contains(e.id)),
    ));
    return changed;
  }

  Future<List<Device>> _insert(String key, List<Device> devices) async {
    final paired = <Document>[];
    final databases = Databases(client);
    final result = await Future.wait<Document>(
      devices.map((e) => databases.createDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: '$key:${e.id}:',
          data: toJson(e))),
      cleanUp: (e) => paired.add(e),
    );
    return result.map((e) => fromJson(e.data)).toList();
  }

  Future<List<Device>> _update(String key, List<Device> devices) async {
    final paired = <Document>[];
    final databases = Databases(client);
    final result = await Future.wait<Document>(
      devices.map((e) => databases.updateDocument(
          databaseId: databaseId,
          collectionId: collectionId,
          documentId: '${e.type}:${e.id}:',
          data: toJson(e))),
      cleanUp: (e) => paired.add(e),
    );
    return result.map((e) => fromJson(e.data)).toList();
  }

  JsonObject toJson(Device device) {
    final json = device.toJson();
    return {
      ...json,
      'dataAsJson': jsonEncode(device.data),
      if (device.energy != null) 'energyAsJson': jsonEncode(device.energy),
    };
  }
}
