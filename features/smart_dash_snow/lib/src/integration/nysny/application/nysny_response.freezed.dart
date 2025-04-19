// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nysny_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NySnyResponse {
  @JsonKey(name: 'requestedby')
  String get requestedBy;
  @JsonKey(name: 'information')
  String get information;
  @JsonKey(name: 'sensors')
  List<NySnySensor> get sensors;

  /// Create a copy of NySnyResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NySnyResponseCopyWith<NySnyResponse> get copyWith =>
      _$NySnyResponseCopyWithImpl<NySnyResponse>(
          this as NySnyResponse, _$identity);

  /// Serializes this NySnyResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NySnyResponse &&
            (identical(other.requestedBy, requestedBy) ||
                other.requestedBy == requestedBy) &&
            (identical(other.information, information) ||
                other.information == information) &&
            const DeepCollectionEquality().equals(other.sensors, sensors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, requestedBy, information,
      const DeepCollectionEquality().hash(sensors));

  @override
  String toString() {
    return 'NySnyResponse(requestedBy: $requestedBy, information: $information, sensors: $sensors)';
  }
}

/// @nodoc
abstract mixin class $NySnyResponseCopyWith<$Res> {
  factory $NySnyResponseCopyWith(
          NySnyResponse value, $Res Function(NySnyResponse) _then) =
      _$NySnyResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'requestedby') String requestedBy,
      @JsonKey(name: 'information') String information,
      @JsonKey(name: 'sensors') List<NySnySensor> sensors});
}

/// @nodoc
class _$NySnyResponseCopyWithImpl<$Res>
    implements $NySnyResponseCopyWith<$Res> {
  _$NySnyResponseCopyWithImpl(this._self, this._then);

  final NySnyResponse _self;
  final $Res Function(NySnyResponse) _then;

  /// Create a copy of NySnyResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestedBy = null,
    Object? information = null,
    Object? sensors = null,
  }) {
    return _then(_self.copyWith(
      requestedBy: null == requestedBy
          ? _self.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _self.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
      sensors: null == sensors
          ? _self.sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as List<NySnySensor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NySnyResponse extends NySnyResponse {
  const _NySnyResponse(
      {@JsonKey(name: 'requestedby') required this.requestedBy,
      @JsonKey(name: 'information') required this.information,
      @JsonKey(name: 'sensors') required final List<NySnySensor> sensors})
      : _sensors = sensors,
        super._();
  factory _NySnyResponse.fromJson(Map<String, dynamic> json) =>
      _$NySnyResponseFromJson(json);

  @override
  @JsonKey(name: 'requestedby')
  final String requestedBy;
  @override
  @JsonKey(name: 'information')
  final String information;
  final List<NySnySensor> _sensors;
  @override
  @JsonKey(name: 'sensors')
  List<NySnySensor> get sensors {
    if (_sensors is EqualUnmodifiableListView) return _sensors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sensors);
  }

  /// Create a copy of NySnyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NySnyResponseCopyWith<_NySnyResponse> get copyWith =>
      __$NySnyResponseCopyWithImpl<_NySnyResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NySnyResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NySnyResponse &&
            (identical(other.requestedBy, requestedBy) ||
                other.requestedBy == requestedBy) &&
            (identical(other.information, information) ||
                other.information == information) &&
            const DeepCollectionEquality().equals(other._sensors, _sensors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, requestedBy, information,
      const DeepCollectionEquality().hash(_sensors));

  @override
  String toString() {
    return 'NySnyResponse(requestedBy: $requestedBy, information: $information, sensors: $sensors)';
  }
}

/// @nodoc
abstract mixin class _$NySnyResponseCopyWith<$Res>
    implements $NySnyResponseCopyWith<$Res> {
  factory _$NySnyResponseCopyWith(
          _NySnyResponse value, $Res Function(_NySnyResponse) _then) =
      __$NySnyResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'requestedby') String requestedBy,
      @JsonKey(name: 'information') String information,
      @JsonKey(name: 'sensors') List<NySnySensor> sensors});
}

/// @nodoc
class __$NySnyResponseCopyWithImpl<$Res>
    implements _$NySnyResponseCopyWith<$Res> {
  __$NySnyResponseCopyWithImpl(this._self, this._then);

  final _NySnyResponse _self;
  final $Res Function(_NySnyResponse) _then;

  /// Create a copy of NySnyResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? requestedBy = null,
    Object? information = null,
    Object? sensors = null,
  }) {
    return _then(_NySnyResponse(
      requestedBy: null == requestedBy
          ? _self.requestedBy
          : requestedBy // ignore: cast_nullable_to_non_nullable
              as String,
      information: null == information
          ? _self.information
          : information // ignore: cast_nullable_to_non_nullable
              as String,
      sensors: null == sensors
          ? _self._sensors
          : sensors // ignore: cast_nullable_to_non_nullable
              as List<NySnySensor>,
    ));
  }
}

// dart format on
