import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:smart_dash_presence/smart_dash_presence.dart';

part 'presence_repository.g.dart';

class PresenceRepository extends BulkHiveRepository<Token, Presence> {
  PresenceRepository(super.ref)
      : super(
          key: 'presences',
          box: 'registered',
          adapter: PresenceAdapter(),
        );

  @override
  String toKey(Token id) => id.name;

  @override
  Token toId(Presence item) => item.token;

  Future<Optional<Presence>> put(Token token) async {
    final presence = await get(token);
    if (!presence.isPresent) {
      final updated = await addOrUpdate(
        Presence.empty(token),
      );
      if (updated.isEmpty) {
        return Optional.empty();
      }
      return Optional.of(updated.item);
    }
    return presence;
  }
}

@Riverpod(keepAlive: true)
PresenceRepository presenceRepository(PresenceRepositoryRef ref) {
  return PresenceRepository(ref);
}

class PresenceAdapter extends TypedAdapter<Presence> {
  PresenceAdapter() : super(HiveTypeId.presence);

  @override
  Presence read(BinaryReader reader) {
    final json = jsonDecode(
      reader.read(),
    );
    try {
      return Presence.fromJson(json);
    } catch (e) {
      // Fix schema mutation
      json['token']['unit'] = ValueUnit.any.name;
      json['token']['capability'] = Capability.any.name;
      return Presence.fromJson(json);
    }
  }

  @override
  void write(BinaryWriter writer, Presence obj) {
    writer.write(jsonEncode(
      obj.toJson(),
    ));
  }
}
