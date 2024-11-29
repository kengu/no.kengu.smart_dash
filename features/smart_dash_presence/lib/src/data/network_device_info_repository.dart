import 'dart:async';
import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_presence/smart_dash_presence.dart';

part 'network_device_info_repository.g.dart';

typedef NetworkDeviceInfoMap = Map<String, NetworkDeviceInfo>;

class NetworkDeviceInfoRepository
    extends BulkHiveRepository<String, NetworkDeviceInfo> {
  NetworkDeviceInfoRepository(super.ref)
      : super(
          key: 'network_devices',
          box: 'registered',
          adapter: NetworkDeviceInfoAdapter(),
        );

  @override
  String toId(NetworkDeviceInfo item) => item.hostId;

  @override
  String toKey(String id) => '$key:$id';

  Future<Optional<NetworkDeviceInfo>> set(NetworkDeviceInfo device) async {
    final result = await addOrUpdate(device);
    return result.isEmpty ? Optional.empty() : Optional.of(result.item);
  }

  Future<NetworkDeviceInfoMap> load() async {
    final items = await getAll();
    return toMap(items);
  }

  Future<bool> save([Iterable<NetworkDeviceInfo>? devices]) async {
    final result = await updateAll(devices ?? <NetworkDeviceInfo>[]);
    return result.isNotEmpty;
  }

  static NetworkDeviceInfoMap toMap(Iterable<NetworkDeviceInfo>? devices) {
    return {for (final e in devices ?? <NetworkDeviceInfo>[]) e.hostId: e};
  }
}

@Riverpod(keepAlive: true)
NetworkDeviceInfoRepository networkDeviceInfoRepository(
    NetworkDeviceInfoRepositoryRef ref) {
  return NetworkDeviceInfoRepository(ref);
}

class NetworkDeviceInfoAdapter extends TypedAdapter<NetworkDeviceInfo> {
  NetworkDeviceInfoAdapter() : super(HiveTypeId.networkDevice);

  @override
  NetworkDeviceInfo read(BinaryReader reader) {
    final json = jsonDecode(
      reader.read(),
    );
    return NetworkDeviceInfo.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, NetworkDeviceInfo obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
