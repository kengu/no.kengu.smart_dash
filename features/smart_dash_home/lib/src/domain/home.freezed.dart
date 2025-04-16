// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Home {
  String get id;
  String get name;
  List<HomeMember> get members;
  List<ServiceConfig> get services;
  Location get location;
  String? get baseUrl;

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeCopyWith<Home> get copyWith =>
      _$HomeCopyWithImpl<Home>(this as Home, _$identity);

  /// Serializes this Home to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Home &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.members, members) &&
            const DeepCollectionEquality().equals(other.services, services) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(members),
      const DeepCollectionEquality().hash(services),
      location,
      baseUrl);

  @override
  String toString() {
    return 'Home(id: $id, name: $name, members: $members, services: $services, location: $location, baseUrl: $baseUrl)';
  }
}

/// @nodoc
abstract mixin class $HomeCopyWith<$Res> {
  factory $HomeCopyWith(Home value, $Res Function(Home) _then) =
      _$HomeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      List<HomeMember> members,
      List<ServiceConfig> services,
      Location location,
      String? baseUrl});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$HomeCopyWithImpl<$Res> implements $HomeCopyWith<$Res> {
  _$HomeCopyWithImpl(this._self, this._then);

  final Home _self;
  final $Res Function(Home) _then;

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? members = null,
    Object? services = null,
    Object? location = null,
    Object? baseUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<HomeMember>,
      services: null == services
          ? _self.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceConfig>,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      baseUrl: freezed == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Home extends Home {
  const _Home(
      {required this.id,
      required this.name,
      required final List<HomeMember> members,
      required final List<ServiceConfig> services,
      required this.location,
      this.baseUrl})
      : _members = members,
        _services = services,
        super._();
  factory _Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  @override
  final String id;
  @override
  final String name;
  final List<HomeMember> _members;
  @override
  List<HomeMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<ServiceConfig> _services;
  @override
  List<ServiceConfig> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final Location location;
  @override
  final String? baseUrl;

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeCopyWith<_Home> get copyWith =>
      __$HomeCopyWithImpl<_Home>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Home &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_services),
      location,
      baseUrl);

  @override
  String toString() {
    return 'Home(id: $id, name: $name, members: $members, services: $services, location: $location, baseUrl: $baseUrl)';
  }
}

/// @nodoc
abstract mixin class _$HomeCopyWith<$Res> implements $HomeCopyWith<$Res> {
  factory _$HomeCopyWith(_Home value, $Res Function(_Home) _then) =
      __$HomeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<HomeMember> members,
      List<ServiceConfig> services,
      Location location,
      String? baseUrl});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$HomeCopyWithImpl<$Res> implements _$HomeCopyWith<$Res> {
  __$HomeCopyWithImpl(this._self, this._then);

  final _Home _self;
  final $Res Function(_Home) _then;

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? members = null,
    Object? services = null,
    Object? location = null,
    Object? baseUrl = freezed,
  }) {
    return _then(_Home(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<HomeMember>,
      services: null == services
          ? _self._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceConfig>,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
      baseUrl: freezed == baseUrl
          ? _self.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Home
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
mixin _$CurrentHome {
  String get homeId;
  String get userId;

  /// Create a copy of CurrentHome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurrentHomeCopyWith<CurrentHome> get copyWith =>
      _$CurrentHomeCopyWithImpl<CurrentHome>(this as CurrentHome, _$identity);

  /// Serializes this CurrentHome to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurrentHome &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, homeId, userId);

  @override
  String toString() {
    return 'CurrentHome(homeId: $homeId, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class $CurrentHomeCopyWith<$Res> {
  factory $CurrentHomeCopyWith(
          CurrentHome value, $Res Function(CurrentHome) _then) =
      _$CurrentHomeCopyWithImpl;
  @useResult
  $Res call({String homeId, String userId});
}

/// @nodoc
class _$CurrentHomeCopyWithImpl<$Res> implements $CurrentHomeCopyWith<$Res> {
  _$CurrentHomeCopyWithImpl(this._self, this._then);

  final CurrentHome _self;
  final $Res Function(CurrentHome) _then;

  /// Create a copy of CurrentHome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeId = null,
    Object? userId = null,
  }) {
    return _then(_self.copyWith(
      homeId: null == homeId
          ? _self.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CurrentHome extends CurrentHome {
  const _CurrentHome({required this.homeId, required this.userId}) : super._();
  factory _CurrentHome.fromJson(Map<String, dynamic> json) =>
      _$CurrentHomeFromJson(json);

  @override
  final String homeId;
  @override
  final String userId;

  /// Create a copy of CurrentHome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurrentHomeCopyWith<_CurrentHome> get copyWith =>
      __$CurrentHomeCopyWithImpl<_CurrentHome>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CurrentHomeToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurrentHome &&
            (identical(other.homeId, homeId) || other.homeId == homeId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, homeId, userId);

  @override
  String toString() {
    return 'CurrentHome(homeId: $homeId, userId: $userId)';
  }
}

/// @nodoc
abstract mixin class _$CurrentHomeCopyWith<$Res>
    implements $CurrentHomeCopyWith<$Res> {
  factory _$CurrentHomeCopyWith(
          _CurrentHome value, $Res Function(_CurrentHome) _then) =
      __$CurrentHomeCopyWithImpl;
  @override
  @useResult
  $Res call({String homeId, String userId});
}

/// @nodoc
class __$CurrentHomeCopyWithImpl<$Res> implements _$CurrentHomeCopyWith<$Res> {
  __$CurrentHomeCopyWithImpl(this._self, this._then);

  final _CurrentHome _self;
  final $Res Function(_CurrentHome) _then;

  /// Create a copy of CurrentHome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? homeId = null,
    Object? userId = null,
  }) {
    return _then(_CurrentHome(
      homeId: null == homeId
          ? _self.homeId
          : homeId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$HomeMember {
  String get key;
  String get name;

  /// Create a copy of HomeMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeMemberCopyWith<HomeMember> get copyWith =>
      _$HomeMemberCopyWithImpl<HomeMember>(this as HomeMember, _$identity);

  /// Serializes this HomeMember to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeMember &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name);

  @override
  String toString() {
    return 'HomeMember(key: $key, name: $name)';
  }
}

/// @nodoc
abstract mixin class $HomeMemberCopyWith<$Res> {
  factory $HomeMemberCopyWith(
          HomeMember value, $Res Function(HomeMember) _then) =
      _$HomeMemberCopyWithImpl;
  @useResult
  $Res call({String key, String name});
}

/// @nodoc
class _$HomeMemberCopyWithImpl<$Res> implements $HomeMemberCopyWith<$Res> {
  _$HomeMemberCopyWithImpl(this._self, this._then);

  final HomeMember _self;
  final $Res Function(HomeMember) _then;

  /// Create a copy of HomeMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _HomeMember extends HomeMember {
  const _HomeMember({required this.key, required this.name}) : super._();
  factory _HomeMember.fromJson(Map<String, dynamic> json) =>
      _$HomeMemberFromJson(json);

  @override
  final String key;
  @override
  final String name;

  /// Create a copy of HomeMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeMemberCopyWith<_HomeMember> get copyWith =>
      __$HomeMemberCopyWithImpl<_HomeMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeMemberToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeMember &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name);

  @override
  String toString() {
    return 'HomeMember(key: $key, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$HomeMemberCopyWith<$Res>
    implements $HomeMemberCopyWith<$Res> {
  factory _$HomeMemberCopyWith(
          _HomeMember value, $Res Function(_HomeMember) _then) =
      __$HomeMemberCopyWithImpl;
  @override
  @useResult
  $Res call({String key, String name});
}

/// @nodoc
class __$HomeMemberCopyWithImpl<$Res> implements _$HomeMemberCopyWith<$Res> {
  __$HomeMemberCopyWithImpl(this._self, this._then);

  final _HomeMember _self;
  final $Res Function(_HomeMember) _then;

  /// Create a copy of HomeMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? name = null,
  }) {
    return _then(_HomeMember(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
