import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';

part 'home.freezed.dart';
part 'home.g.dart';

@freezed
class Home with _$Home {
  const Home._();

  const factory Home({
    required String name,
    required List<HomeMember> members,
    required List<ServiceConfig> services,
    String? address,
  }) = _Home;

  factory Home.fromJson(Map<String, Object?> json) => _$HomeFromJson(json);

  Optional<ServiceConfig> firstServiceWhere(String key) =>
      services.firstWhereOptional((c) => c.key == key);

  List<ServiceConfig> serviceWhere(String key) =>
      services.where((c) => c.key == key).toList();
}

/// Current home selected by [userId].
///
/// This model stores 1:1 relationship
/// between a [Home] and a [User] that
/// represents the home selected in the
/// app.
///
/// It is only intended to be stored
/// locally in each app.
@freezed
class CurrentHome with _$CurrentHome {
  const CurrentHome._();

  const factory CurrentHome({
    required String name,
    required String userId,
  }) = _CurrentHome;

  factory CurrentHome.fromJson(Map<String, Object?> json) =>
      _$CurrentHomeFromJson(json);
}

@freezed
class HomeMember with _$HomeMember {
  const HomeMember._();

  const factory HomeMember({
    required String key,
    required String name,
  }) = _HomeMember;

  factory HomeMember.fromJson(Map<String, Object?> json) =>
      _$HomeMemberFromJson(json);
}

class HomeFields {
  static const String name = 'name';
  static const String address = 'address';
  static const String members = 'members';
  static const String services = 'services';
}

class HomeMemberFields {
  static const String key = 'key';
  static const String name = 'name';
}
