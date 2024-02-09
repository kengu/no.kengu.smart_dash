// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SystemInfo {
  double? get cpuApp => throw _privateConstructorUsedError;
  double get cpuTotal => throw _privateConstructorUsedError;
  int get memApp => throw _privateConstructorUsedError;
  int get memFree => throw _privateConstructorUsedError;
  int get memTotal => throw _privateConstructorUsedError;
  bool get memIsLow => throw _privateConstructorUsedError;
  double get batteryLevel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SystemInfoCopyWith<SystemInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemInfoCopyWith<$Res> {
  factory $SystemInfoCopyWith(
          SystemInfo value, $Res Function(SystemInfo) then) =
      _$SystemInfoCopyWithImpl<$Res, SystemInfo>;
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
class _$SystemInfoCopyWithImpl<$Res, $Val extends SystemInfo>
    implements $SystemInfoCopyWith<$Res> {
  _$SystemInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      cpuApp: freezed == cpuApp
          ? _value.cpuApp
          : cpuApp // ignore: cast_nullable_to_non_nullable
              as double?,
      cpuTotal: null == cpuTotal
          ? _value.cpuTotal
          : cpuTotal // ignore: cast_nullable_to_non_nullable
              as double,
      memApp: null == memApp
          ? _value.memApp
          : memApp // ignore: cast_nullable_to_non_nullable
              as int,
      memFree: null == memFree
          ? _value.memFree
          : memFree // ignore: cast_nullable_to_non_nullable
              as int,
      memTotal: null == memTotal
          ? _value.memTotal
          : memTotal // ignore: cast_nullable_to_non_nullable
              as int,
      memIsLow: null == memIsLow
          ? _value.memIsLow
          : memIsLow // ignore: cast_nullable_to_non_nullable
              as bool,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SystemInfoImplCopyWith<$Res>
    implements $SystemInfoCopyWith<$Res> {
  factory _$$SystemInfoImplCopyWith(
          _$SystemInfoImpl value, $Res Function(_$SystemInfoImpl) then) =
      __$$SystemInfoImplCopyWithImpl<$Res>;
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
class __$$SystemInfoImplCopyWithImpl<$Res>
    extends _$SystemInfoCopyWithImpl<$Res, _$SystemInfoImpl>
    implements _$$SystemInfoImplCopyWith<$Res> {
  __$$SystemInfoImplCopyWithImpl(
      _$SystemInfoImpl _value, $Res Function(_$SystemInfoImpl) _then)
      : super(_value, _then);

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
    return _then(_$SystemInfoImpl(
      cpuApp: freezed == cpuApp
          ? _value.cpuApp
          : cpuApp // ignore: cast_nullable_to_non_nullable
              as double?,
      cpuTotal: null == cpuTotal
          ? _value.cpuTotal
          : cpuTotal // ignore: cast_nullable_to_non_nullable
              as double,
      memApp: null == memApp
          ? _value.memApp
          : memApp // ignore: cast_nullable_to_non_nullable
              as int,
      memFree: null == memFree
          ? _value.memFree
          : memFree // ignore: cast_nullable_to_non_nullable
              as int,
      memTotal: null == memTotal
          ? _value.memTotal
          : memTotal // ignore: cast_nullable_to_non_nullable
              as int,
      memIsLow: null == memIsLow
          ? _value.memIsLow
          : memIsLow // ignore: cast_nullable_to_non_nullable
              as bool,
      batteryLevel: null == batteryLevel
          ? _value.batteryLevel
          : batteryLevel // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SystemInfoImpl extends _SystemInfo {
  const _$SystemInfoImpl(
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

  @override
  String toString() {
    return 'SystemInfo(cpuApp: $cpuApp, cpuTotal: $cpuTotal, memApp: $memApp, memFree: $memFree, memTotal: $memTotal, memIsLow: $memIsLow, batteryLevel: $batteryLevel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemInfoImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemInfoImplCopyWith<_$SystemInfoImpl> get copyWith =>
      __$$SystemInfoImplCopyWithImpl<_$SystemInfoImpl>(this, _$identity);
}

abstract class _SystemInfo extends SystemInfo {
  const factory _SystemInfo(
      {required final double? cpuApp,
      required final double cpuTotal,
      required final int memApp,
      required final int memFree,
      required final int memTotal,
      required final bool memIsLow,
      required final double batteryLevel}) = _$SystemInfoImpl;
  const _SystemInfo._() : super._();

  @override
  double? get cpuApp;
  @override
  double get cpuTotal;
  @override
  int get memApp;
  @override
  int get memFree;
  @override
  int get memTotal;
  @override
  bool get memIsLow;
  @override
  double get batteryLevel;
  @override
  @JsonKey(ignore: true)
  _$$SystemInfoImplCopyWith<_$SystemInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
