// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SystemInfo {
  double? get cpuApp;
  double get cpuTotal;
  int get memApp;
  int get memFree;
  int get memTotal;
  bool get memIsLow;
  double get batteryLevel;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SystemInfoCopyWith<SystemInfo> get copyWith =>
      _$SystemInfoCopyWithImpl<SystemInfo>(this as SystemInfo, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SystemInfo &&
            (identical(other.cpuApp, cpuApp) || other.cpuApp == cpuApp) &&
            (identical(other.cpuTotal, cpuTotal) ||
                other.cpuTotal == cpuTotal) &&
            (identical(other.memApp, memApp) || other.memApp == memApp) &&
            (identical(other.memFree, memFree) || other.memFree == memFree) &&
            (identical(other.memTotal, memTotal) ||
                other.memTotal == memTotal) &&
            (identical(other.memIsLow, memIsLow) ||
                other.memIsLow == memIsLow) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cpuApp, cpuTotal, memApp,
      memFree, memTotal, memIsLow, batteryLevel);

  @override
  String toString() {
    return 'SystemInfo(cpuApp: $cpuApp, cpuTotal: $cpuTotal, memApp: $memApp, memFree: $memFree, memTotal: $memTotal, memIsLow: $memIsLow, batteryLevel: $batteryLevel)';
  }
}

/// @nodoc
abstract mixin class $SystemInfoCopyWith<$Res> {
  factory $SystemInfoCopyWith(
          SystemInfo value, $Res Function(SystemInfo) _then) =
      _$SystemInfoCopyWithImpl;
  @useResult
  $Res call(
      {double? cpuApp,
      double cpuTotal,
      int memApp,
      int memFree,
      int memTotal,
      bool memIsLow,
      double batteryLevel});
}

/// @nodoc
class _$SystemInfoCopyWithImpl<$Res> implements $SystemInfoCopyWith<$Res> {
  _$SystemInfoCopyWithImpl(this._self, this._then);

  final SystemInfo _self;
  final $Res Function(SystemInfo) _then;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cpuApp = freezed,
    Object? cpuTotal = null,
    Object? memApp = null,
    Object? memFree = null,
    Object? memTotal = null,
    Object? memIsLow = null,
    Object? batteryLevel = null,
  }) {
    return _then(_self.copyWith(
      cpuApp: freezed == cpuApp
          ? _self.cpuApp
          : cpuApp // ignore: cast_nullable_to_non_nullable
              as double?,
      cpuTotal: null == cpuTotal
          ? _self.cpuTotal
          : cpuTotal // ignore: cast_nullable_to_non_nullable
              as double,
      memApp: null == memApp
          ? _self.memApp
          : memApp // ignore: cast_nullable_to_non_nullable
              as int,
      memFree: null == memFree
          ? _self.memFree
          : memFree // ignore: cast_nullable_to_non_nullable
              as int,
      memTotal: null == memTotal
          ? _self.memTotal
          : memTotal // ignore: cast_nullable_to_non_nullable
              as int,
      memIsLow: null == memIsLow
          ? _self.memIsLow
          : memIsLow // ignore: cast_nullable_to_non_nullable
              as bool,
      batteryLevel: null == batteryLevel
          ? _self.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _SystemInfo extends SystemInfo {
  const _SystemInfo(
      {required this.cpuApp,
      required this.cpuTotal,
      required this.memApp,
      required this.memFree,
      required this.memTotal,
      required this.memIsLow,
      required this.batteryLevel})
      : super._();

  @override
  final double? cpuApp;
  @override
  final double cpuTotal;
  @override
  final int memApp;
  @override
  final int memFree;
  @override
  final int memTotal;
  @override
  final bool memIsLow;
  @override
  final double batteryLevel;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SystemInfoCopyWith<_SystemInfo> get copyWith =>
      __$SystemInfoCopyWithImpl<_SystemInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SystemInfo &&
            (identical(other.cpuApp, cpuApp) || other.cpuApp == cpuApp) &&
            (identical(other.cpuTotal, cpuTotal) ||
                other.cpuTotal == cpuTotal) &&
            (identical(other.memApp, memApp) || other.memApp == memApp) &&
            (identical(other.memFree, memFree) || other.memFree == memFree) &&
            (identical(other.memTotal, memTotal) ||
                other.memTotal == memTotal) &&
            (identical(other.memIsLow, memIsLow) ||
                other.memIsLow == memIsLow) &&
            (identical(other.batteryLevel, batteryLevel) ||
                other.batteryLevel == batteryLevel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cpuApp, cpuTotal, memApp,
      memFree, memTotal, memIsLow, batteryLevel);

  @override
  String toString() {
    return 'SystemInfo(cpuApp: $cpuApp, cpuTotal: $cpuTotal, memApp: $memApp, memFree: $memFree, memTotal: $memTotal, memIsLow: $memIsLow, batteryLevel: $batteryLevel)';
  }
}

/// @nodoc
abstract mixin class _$SystemInfoCopyWith<$Res>
    implements $SystemInfoCopyWith<$Res> {
  factory _$SystemInfoCopyWith(
          _SystemInfo value, $Res Function(_SystemInfo) _then) =
      __$SystemInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double? cpuApp,
      double cpuTotal,
      int memApp,
      int memFree,
      int memTotal,
      bool memIsLow,
      double batteryLevel});
}

/// @nodoc
class __$SystemInfoCopyWithImpl<$Res> implements _$SystemInfoCopyWith<$Res> {
  __$SystemInfoCopyWithImpl(this._self, this._then);

  final _SystemInfo _self;
  final $Res Function(_SystemInfo) _then;

  /// Create a copy of SystemInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cpuApp = freezed,
    Object? cpuTotal = null,
    Object? memApp = null,
    Object? memFree = null,
    Object? memTotal = null,
    Object? memIsLow = null,
    Object? batteryLevel = null,
  }) {
    return _then(_SystemInfo(
      cpuApp: freezed == cpuApp
          ? _self.cpuApp
          : cpuApp // ignore: cast_nullable_to_non_nullable
              as double?,
      cpuTotal: null == cpuTotal
          ? _self.cpuTotal
          : cpuTotal // ignore: cast_nullable_to_non_nullable
              as double,
      memApp: null == memApp
          ? _self.memApp
          : memApp // ignore: cast_nullable_to_non_nullable
              as int,
      memFree: null == memFree
          ? _self.memFree
          : memFree // ignore: cast_nullable_to_non_nullable
              as int,
      memTotal: null == memTotal
          ? _self.memTotal
          : memTotal // ignore: cast_nullable_to_non_nullable
              as int,
      memIsLow: null == memIsLow
          ? _self.memIsLow
          : memIsLow // ignore: cast_nullable_to_non_nullable
              as bool,
      batteryLevel: null == batteryLevel
          ? _self.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
