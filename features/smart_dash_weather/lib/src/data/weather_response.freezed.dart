// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherResponse {
  @JsonKey(name: 'data')
  WeatherState get data;
  @JsonKey(name: 'expires')
  DateTime get expires;
  @JsonKey(name: 'last_modified')
  DateTime get lastModified;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherResponseCopyWith<WeatherResponse> get copyWith =>
      _$WeatherResponseCopyWithImpl<WeatherResponse>(
          this as WeatherResponse, _$identity);

  /// Serializes this WeatherResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.expires, expires) || other.expires == expires) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, expires, lastModified);

  @override
  String toString() {
    return 'WeatherResponse(data: $data, expires: $expires, lastModified: $lastModified)';
  }
}

/// @nodoc
abstract mixin class $WeatherResponseCopyWith<$Res> {
  factory $WeatherResponseCopyWith(
          WeatherResponse value, $Res Function(WeatherResponse) _then) =
      _$WeatherResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'data') WeatherState data,
      @JsonKey(name: 'expires') DateTime expires,
      @JsonKey(name: 'last_modified') DateTime lastModified});

  $WeatherStateCopyWith<$Res> get data;
}

/// @nodoc
class _$WeatherResponseCopyWithImpl<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  _$WeatherResponseCopyWithImpl(this._self, this._then);

  final WeatherResponse _self;
  final $Res Function(WeatherResponse) _then;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? expires = null,
    Object? lastModified = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      expires: null == expires
          ? _self.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModified: null == lastModified
          ? _self.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherStateCopyWith<$Res> get data {
    return $WeatherStateCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherResponse extends WeatherResponse {
  const _WeatherResponse(
      {@JsonKey(name: 'data') required this.data,
      @JsonKey(name: 'expires') required this.expires,
      @JsonKey(name: 'last_modified') required this.lastModified})
      : super._();
  factory _WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  @override
  @JsonKey(name: 'data')
  final WeatherState data;
  @override
  @JsonKey(name: 'expires')
  final DateTime expires;
  @override
  @JsonKey(name: 'last_modified')
  final DateTime lastModified;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherResponseCopyWith<_WeatherResponse> get copyWith =>
      __$WeatherResponseCopyWithImpl<_WeatherResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherResponse &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.expires, expires) || other.expires == expires) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, expires, lastModified);

  @override
  String toString() {
    return 'WeatherResponse(data: $data, expires: $expires, lastModified: $lastModified)';
  }
}

/// @nodoc
abstract mixin class _$WeatherResponseCopyWith<$Res>
    implements $WeatherResponseCopyWith<$Res> {
  factory _$WeatherResponseCopyWith(
          _WeatherResponse value, $Res Function(_WeatherResponse) _then) =
      __$WeatherResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'data') WeatherState data,
      @JsonKey(name: 'expires') DateTime expires,
      @JsonKey(name: 'last_modified') DateTime lastModified});

  @override
  $WeatherStateCopyWith<$Res> get data;
}

/// @nodoc
class __$WeatherResponseCopyWithImpl<$Res>
    implements _$WeatherResponseCopyWith<$Res> {
  __$WeatherResponseCopyWithImpl(this._self, this._then);

  final _WeatherResponse _self;
  final $Res Function(_WeatherResponse) _then;

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? expires = null,
    Object? lastModified = null,
  }) {
    return _then(_WeatherResponse(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as WeatherState,
      expires: null == expires
          ? _self.expires
          : expires // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastModified: null == lastModified
          ? _self.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of WeatherResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherStateCopyWith<$Res> get data {
    return $WeatherStateCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

// dart format on
