// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return _Dashboard.fromJson(json);
}

/// @nodoc
mixin _$Dashboard {
  String get key => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<Token> get tokens => throw _privateConstructorUsedError;
  List<Identity> get ids => throw _privateConstructorUsedError;
  DashboardLayout get mobile => throw _privateConstructorUsedError;
  DashboardLayout get tablet => throw _privateConstructorUsedError;
  DashboardLayout get desktop => throw _privateConstructorUsedError;
  DashboardLayout get mobileLarge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardCopyWith<Dashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) then) =
      _$DashboardCopyWithImpl<$Res, Dashboard>;
  @useResult
  $Res call(
      {String key,
      String title,
      List<Token> tokens,
      List<Identity> ids,
      DashboardLayout mobile,
      DashboardLayout tablet,
      DashboardLayout desktop,
      DashboardLayout mobileLarge});

  $DashboardLayoutCopyWith<$Res> get mobile;
  $DashboardLayoutCopyWith<$Res> get tablet;
  $DashboardLayoutCopyWith<$Res> get desktop;
  $DashboardLayoutCopyWith<$Res> get mobileLarge;
}

/// @nodoc
class _$DashboardCopyWithImpl<$Res, $Val extends Dashboard>
    implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? tokens = null,
    Object? ids = null,
    Object? mobile = null,
    Object? tablet = null,
    Object? desktop = null,
    Object? mobileLarge = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      ids: null == ids
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<Identity>,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      tablet: null == tablet
          ? _value.tablet
          : tablet // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      desktop: null == desktop
          ? _value.desktop
          : desktop // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      mobileLarge: null == mobileLarge
          ? _value.mobileLarge
          : mobileLarge // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get mobile {
    return $DashboardLayoutCopyWith<$Res>(_value.mobile, (value) {
      return _then(_value.copyWith(mobile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get tablet {
    return $DashboardLayoutCopyWith<$Res>(_value.tablet, (value) {
      return _then(_value.copyWith(tablet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get desktop {
    return $DashboardLayoutCopyWith<$Res>(_value.desktop, (value) {
      return _then(_value.copyWith(desktop: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get mobileLarge {
    return $DashboardLayoutCopyWith<$Res>(_value.mobileLarge, (value) {
      return _then(_value.copyWith(mobileLarge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardImplCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$$DashboardImplCopyWith(
          _$DashboardImpl value, $Res Function(_$DashboardImpl) then) =
      __$$DashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String title,
      List<Token> tokens,
      List<Identity> ids,
      DashboardLayout mobile,
      DashboardLayout tablet,
      DashboardLayout desktop,
      DashboardLayout mobileLarge});

  @override
  $DashboardLayoutCopyWith<$Res> get mobile;
  @override
  $DashboardLayoutCopyWith<$Res> get tablet;
  @override
  $DashboardLayoutCopyWith<$Res> get desktop;
  @override
  $DashboardLayoutCopyWith<$Res> get mobileLarge;
}

/// @nodoc
class __$$DashboardImplCopyWithImpl<$Res>
    extends _$DashboardCopyWithImpl<$Res, _$DashboardImpl>
    implements _$$DashboardImplCopyWith<$Res> {
  __$$DashboardImplCopyWithImpl(
      _$DashboardImpl _value, $Res Function(_$DashboardImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? title = null,
    Object? tokens = null,
    Object? ids = null,
    Object? mobile = null,
    Object? tablet = null,
    Object? desktop = null,
    Object? mobileLarge = null,
  }) {
    return _then(_$DashboardImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      ids: null == ids
          ? _value._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<Identity>,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      tablet: null == tablet
          ? _value.tablet
          : tablet // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      desktop: null == desktop
          ? _value.desktop
          : desktop // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      mobileLarge: null == mobileLarge
          ? _value.mobileLarge
          : mobileLarge // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardImpl extends _Dashboard {
  const _$DashboardImpl(
      {required this.key,
      required this.title,
      required final List<Token> tokens,
      required final List<Identity> ids,
      required this.mobile,
      required this.tablet,
      required this.desktop,
      required this.mobileLarge})
      : _tokens = tokens,
        _ids = ids,
        super._();

  factory _$DashboardImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardImplFromJson(json);

  @override
  final String key;
  @override
  final String title;
  final List<Token> _tokens;
  @override
  List<Token> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  final List<Identity> _ids;
  @override
  List<Identity> get ids {
    if (_ids is EqualUnmodifiableListView) return _ids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ids);
  }

  @override
  final DashboardLayout mobile;
  @override
  final DashboardLayout tablet;
  @override
  final DashboardLayout desktop;
  @override
  final DashboardLayout mobileLarge;

  @override
  String toString() {
    return 'Dashboard(key: $key, title: $title, tokens: $tokens, ids: $ids, mobile: $mobile, tablet: $tablet, desktop: $desktop, mobileLarge: $mobileLarge)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens) &&
            const DeepCollectionEquality().equals(other._ids, _ids) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.tablet, tablet) || other.tablet == tablet) &&
            (identical(other.desktop, desktop) || other.desktop == desktop) &&
            (identical(other.mobileLarge, mobileLarge) ||
                other.mobileLarge == mobileLarge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      title,
      const DeepCollectionEquality().hash(_tokens),
      const DeepCollectionEquality().hash(_ids),
      mobile,
      tablet,
      desktop,
      mobileLarge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      __$$DashboardImplCopyWithImpl<_$DashboardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardImplToJson(
      this,
    );
  }
}

abstract class _Dashboard extends Dashboard {
  const factory _Dashboard(
      {required final String key,
      required final String title,
      required final List<Token> tokens,
      required final List<Identity> ids,
      required final DashboardLayout mobile,
      required final DashboardLayout tablet,
      required final DashboardLayout desktop,
      required final DashboardLayout mobileLarge}) = _$DashboardImpl;
  const _Dashboard._() : super._();

  factory _Dashboard.fromJson(Map<String, dynamic> json) =
      _$DashboardImpl.fromJson;

  @override
  String get key;
  @override
  String get title;
  @override
  List<Token> get tokens;
  @override
  List<Identity> get ids;
  @override
  DashboardLayout get mobile;
  @override
  DashboardLayout get tablet;
  @override
  DashboardLayout get desktop;
  @override
  DashboardLayout get mobileLarge;
  @override
  @JsonKey(ignore: true)
  _$$DashboardImplCopyWith<_$DashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardLayout _$DashboardLayoutFromJson(Map<String, dynamic> json) {
  return _DashboardLayout.fromJson(json);
}

/// @nodoc
mixin _$DashboardLayout {
  @JsonKey(name: 'slotCount')
  int get slotCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'slotHeight')
  double get slotHeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'items')
  List<DashboardItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardLayoutCopyWith<DashboardLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardLayoutCopyWith<$Res> {
  factory $DashboardLayoutCopyWith(
          DashboardLayout value, $Res Function(DashboardLayout) then) =
      _$DashboardLayoutCopyWithImpl<$Res, DashboardLayout>;
  @useResult
  $Res call(
      {@JsonKey(name: 'slotCount') int slotCount,
      @JsonKey(name: 'slotHeight') double slotHeight,
      @JsonKey(name: 'items') List<DashboardItem> items});
}

/// @nodoc
class _$DashboardLayoutCopyWithImpl<$Res, $Val extends DashboardLayout>
    implements $DashboardLayoutCopyWith<$Res> {
  _$DashboardLayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotCount = null,
    Object? slotHeight = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      slotCount: null == slotCount
          ? _value.slotCount
          : slotCount // ignore: cast_nullable_to_non_nullable
              as int,
      slotHeight: null == slotHeight
          ? _value.slotHeight
          : slotHeight // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DashboardItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardLayoutImplCopyWith<$Res>
    implements $DashboardLayoutCopyWith<$Res> {
  factory _$$DashboardLayoutImplCopyWith(_$DashboardLayoutImpl value,
          $Res Function(_$DashboardLayoutImpl) then) =
      __$$DashboardLayoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'slotCount') int slotCount,
      @JsonKey(name: 'slotHeight') double slotHeight,
      @JsonKey(name: 'items') List<DashboardItem> items});
}

/// @nodoc
class __$$DashboardLayoutImplCopyWithImpl<$Res>
    extends _$DashboardLayoutCopyWithImpl<$Res, _$DashboardLayoutImpl>
    implements _$$DashboardLayoutImplCopyWith<$Res> {
  __$$DashboardLayoutImplCopyWithImpl(
      _$DashboardLayoutImpl _value, $Res Function(_$DashboardLayoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotCount = null,
    Object? slotHeight = null,
    Object? items = null,
  }) {
    return _then(_$DashboardLayoutImpl(
      slotCount: null == slotCount
          ? _value.slotCount
          : slotCount // ignore: cast_nullable_to_non_nullable
              as int,
      slotHeight: null == slotHeight
          ? _value.slotHeight
          : slotHeight // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DashboardItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardLayoutImpl implements _DashboardLayout {
  const _$DashboardLayoutImpl(
      {@JsonKey(name: 'slotCount') required this.slotCount,
      @JsonKey(name: 'slotHeight') required this.slotHeight,
      @JsonKey(name: 'items') required final List<DashboardItem> items})
      : _items = items;

  factory _$DashboardLayoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardLayoutImplFromJson(json);

  @override
  @JsonKey(name: 'slotCount')
  final int slotCount;
  @override
  @JsonKey(name: 'slotHeight')
  final double slotHeight;
  final List<DashboardItem> _items;
  @override
  @JsonKey(name: 'items')
  List<DashboardItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'DashboardLayout(slotCount: $slotCount, slotHeight: $slotHeight, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardLayoutImpl &&
            (identical(other.slotCount, slotCount) ||
                other.slotCount == slotCount) &&
            (identical(other.slotHeight, slotHeight) ||
                other.slotHeight == slotHeight) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slotCount, slotHeight,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardLayoutImplCopyWith<_$DashboardLayoutImpl> get copyWith =>
      __$$DashboardLayoutImplCopyWithImpl<_$DashboardLayoutImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardLayoutImplToJson(
      this,
    );
  }
}

abstract class _DashboardLayout implements DashboardLayout {
  const factory _DashboardLayout(
          {@JsonKey(name: 'slotCount') required final int slotCount,
          @JsonKey(name: 'slotHeight') required final double slotHeight,
          @JsonKey(name: 'items') required final List<DashboardItem> items}) =
      _$DashboardLayoutImpl;

  factory _DashboardLayout.fromJson(Map<String, dynamic> json) =
      _$DashboardLayoutImpl.fromJson;

  @override
  @JsonKey(name: 'slotCount')
  int get slotCount;
  @override
  @JsonKey(name: 'slotHeight')
  double get slotHeight;
  @override
  @JsonKey(name: 'items')
  List<DashboardItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$DashboardLayoutImplCopyWith<_$DashboardLayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardItem _$DashboardItemFromJson(Map<String, dynamic> json) {
  return _DashboardItem.fromJson(json);
}

/// @nodoc
mixin _$DashboardItem {
  @JsonKey(name: 'item_id')
  String get key => throw _privateConstructorUsedError;
  @JsonKey(name: 'layout')
  DashboardItemLayout get layout => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardItemCopyWith<DashboardItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardItemCopyWith<$Res> {
  factory $DashboardItemCopyWith(
          DashboardItem value, $Res Function(DashboardItem) then) =
      _$DashboardItemCopyWithImpl<$Res, DashboardItem>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') String key,
      @JsonKey(name: 'layout') DashboardItemLayout layout});

  $DashboardItemLayoutCopyWith<$Res> get layout;
}

/// @nodoc
class _$DashboardItemCopyWithImpl<$Res, $Val extends DashboardItem>
    implements $DashboardItemCopyWith<$Res> {
  _$DashboardItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? layout = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as DashboardItemLayout,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DashboardItemLayoutCopyWith<$Res> get layout {
    return $DashboardItemLayoutCopyWith<$Res>(_value.layout, (value) {
      return _then(_value.copyWith(layout: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardItemImplCopyWith<$Res>
    implements $DashboardItemCopyWith<$Res> {
  factory _$$DashboardItemImplCopyWith(
          _$DashboardItemImpl value, $Res Function(_$DashboardItemImpl) then) =
      __$$DashboardItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') String key,
      @JsonKey(name: 'layout') DashboardItemLayout layout});

  @override
  $DashboardItemLayoutCopyWith<$Res> get layout;
}

/// @nodoc
class __$$DashboardItemImplCopyWithImpl<$Res>
    extends _$DashboardItemCopyWithImpl<$Res, _$DashboardItemImpl>
    implements _$$DashboardItemImplCopyWith<$Res> {
  __$$DashboardItemImplCopyWithImpl(
      _$DashboardItemImpl _value, $Res Function(_$DashboardItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? layout = null,
  }) {
    return _then(_$DashboardItemImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      layout: null == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as DashboardItemLayout,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardItemImpl implements _DashboardItem {
  const _$DashboardItemImpl(
      {@JsonKey(name: 'item_id') required this.key,
      @JsonKey(name: 'layout') required this.layout});

  factory _$DashboardItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardItemImplFromJson(json);

  @override
  @JsonKey(name: 'item_id')
  final String key;
  @override
  @JsonKey(name: 'layout')
  final DashboardItemLayout layout;

  @override
  String toString() {
    return 'DashboardItem(key: $key, layout: $layout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardItemImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.layout, layout) || other.layout == layout));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, layout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardItemImplCopyWith<_$DashboardItemImpl> get copyWith =>
      __$$DashboardItemImplCopyWithImpl<_$DashboardItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardItemImplToJson(
      this,
    );
  }
}

abstract class _DashboardItem implements DashboardItem {
  const factory _DashboardItem(
          {@JsonKey(name: 'item_id') required final String key,
          @JsonKey(name: 'layout') required final DashboardItemLayout layout}) =
      _$DashboardItemImpl;

  factory _DashboardItem.fromJson(Map<String, dynamic> json) =
      _$DashboardItemImpl.fromJson;

  @override
  @JsonKey(name: 'item_id')
  String get key;
  @override
  @JsonKey(name: 'layout')
  DashboardItemLayout get layout;
  @override
  @JsonKey(ignore: true)
  _$$DashboardItemImplCopyWith<_$DashboardItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardItemLayout _$DashboardItemLayoutFromJson(Map<String, dynamic> json) {
  return _DashboardItemLayout.fromJson(json);
}

/// @nodoc
mixin _$DashboardItemLayout {
  @JsonKey(name: 'w')
  int get width => throw _privateConstructorUsedError;
  @JsonKey(name: 'h')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_W')
  int get minWidth => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_H')
  int get minHeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_W')
  int? get maxWidth => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_H')
  int? get maxHeight => throw _privateConstructorUsedError;
  @JsonKey(name: 's_X')
  int? get startX => throw _privateConstructorUsedError;
  @JsonKey(name: 's_Y')
  int? get startY => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardItemLayoutCopyWith<DashboardItemLayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardItemLayoutCopyWith<$Res> {
  factory $DashboardItemLayoutCopyWith(
          DashboardItemLayout value, $Res Function(DashboardItemLayout) then) =
      _$DashboardItemLayoutCopyWithImpl<$Res, DashboardItemLayout>;
  @useResult
  $Res call(
      {@JsonKey(name: 'w') int width,
      @JsonKey(name: 'h') int height,
      @JsonKey(name: 'min_W') int minWidth,
      @JsonKey(name: 'min_H') int minHeight,
      @JsonKey(name: 'max_W') int? maxWidth,
      @JsonKey(name: 'max_H') int? maxHeight,
      @JsonKey(name: 's_X') int? startX,
      @JsonKey(name: 's_Y') int? startY});
}

/// @nodoc
class _$DashboardItemLayoutCopyWithImpl<$Res, $Val extends DashboardItemLayout>
    implements $DashboardItemLayoutCopyWith<$Res> {
  _$DashboardItemLayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? minWidth = null,
    Object? minHeight = null,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
    Object? startX = freezed,
    Object? startY = freezed,
  }) {
    return _then(_value.copyWith(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      minWidth: null == minWidth
          ? _value.minWidth
          : minWidth // ignore: cast_nullable_to_non_nullable
              as int,
      minHeight: null == minHeight
          ? _value.minHeight
          : minHeight // ignore: cast_nullable_to_non_nullable
              as int,
      maxWidth: freezed == maxWidth
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeight: freezed == maxHeight
          ? _value.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      startX: freezed == startX
          ? _value.startX
          : startX // ignore: cast_nullable_to_non_nullable
              as int?,
      startY: freezed == startY
          ? _value.startY
          : startY // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardItemLayoutImplCopyWith<$Res>
    implements $DashboardItemLayoutCopyWith<$Res> {
  factory _$$DashboardItemLayoutImplCopyWith(_$DashboardItemLayoutImpl value,
          $Res Function(_$DashboardItemLayoutImpl) then) =
      __$$DashboardItemLayoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'w') int width,
      @JsonKey(name: 'h') int height,
      @JsonKey(name: 'min_W') int minWidth,
      @JsonKey(name: 'min_H') int minHeight,
      @JsonKey(name: 'max_W') int? maxWidth,
      @JsonKey(name: 'max_H') int? maxHeight,
      @JsonKey(name: 's_X') int? startX,
      @JsonKey(name: 's_Y') int? startY});
}

/// @nodoc
class __$$DashboardItemLayoutImplCopyWithImpl<$Res>
    extends _$DashboardItemLayoutCopyWithImpl<$Res, _$DashboardItemLayoutImpl>
    implements _$$DashboardItemLayoutImplCopyWith<$Res> {
  __$$DashboardItemLayoutImplCopyWithImpl(_$DashboardItemLayoutImpl _value,
      $Res Function(_$DashboardItemLayoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? width = null,
    Object? height = null,
    Object? minWidth = null,
    Object? minHeight = null,
    Object? maxWidth = freezed,
    Object? maxHeight = freezed,
    Object? startX = freezed,
    Object? startY = freezed,
  }) {
    return _then(_$DashboardItemLayoutImpl(
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      minWidth: null == minWidth
          ? _value.minWidth
          : minWidth // ignore: cast_nullable_to_non_nullable
              as int,
      minHeight: null == minHeight
          ? _value.minHeight
          : minHeight // ignore: cast_nullable_to_non_nullable
              as int,
      maxWidth: freezed == maxWidth
          ? _value.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeight: freezed == maxHeight
          ? _value.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      startX: freezed == startX
          ? _value.startX
          : startX // ignore: cast_nullable_to_non_nullable
              as int?,
      startY: freezed == startY
          ? _value.startY
          : startY // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardItemLayoutImpl implements _DashboardItemLayout {
  const _$DashboardItemLayoutImpl(
      {@JsonKey(name: 'w') required this.width,
      @JsonKey(name: 'h') required this.height,
      @JsonKey(name: 'min_W') required this.minWidth,
      @JsonKey(name: 'min_H') required this.minHeight,
      @JsonKey(name: 'max_W') this.maxWidth,
      @JsonKey(name: 'max_H') this.maxHeight,
      @JsonKey(name: 's_X') this.startX,
      @JsonKey(name: 's_Y') this.startY});

  factory _$DashboardItemLayoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardItemLayoutImplFromJson(json);

  @override
  @JsonKey(name: 'w')
  final int width;
  @override
  @JsonKey(name: 'h')
  final int height;
  @override
  @JsonKey(name: 'min_W')
  final int minWidth;
  @override
  @JsonKey(name: 'min_H')
  final int minHeight;
  @override
  @JsonKey(name: 'max_W')
  final int? maxWidth;
  @override
  @JsonKey(name: 'max_H')
  final int? maxHeight;
  @override
  @JsonKey(name: 's_X')
  final int? startX;
  @override
  @JsonKey(name: 's_Y')
  final int? startY;

  @override
  String toString() {
    return 'DashboardItemLayout(width: $width, height: $height, minWidth: $minWidth, minHeight: $minHeight, maxWidth: $maxWidth, maxHeight: $maxHeight, startX: $startX, startY: $startY)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardItemLayoutImpl &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.minWidth, minWidth) ||
                other.minWidth == minWidth) &&
            (identical(other.minHeight, minHeight) ||
                other.minHeight == minHeight) &&
            (identical(other.maxWidth, maxWidth) ||
                other.maxWidth == maxWidth) &&
            (identical(other.maxHeight, maxHeight) ||
                other.maxHeight == maxHeight) &&
            (identical(other.startX, startX) || other.startX == startX) &&
            (identical(other.startY, startY) || other.startY == startY));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, minWidth,
      minHeight, maxWidth, maxHeight, startX, startY);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardItemLayoutImplCopyWith<_$DashboardItemLayoutImpl> get copyWith =>
      __$$DashboardItemLayoutImplCopyWithImpl<_$DashboardItemLayoutImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardItemLayoutImplToJson(
      this,
    );
  }
}

abstract class _DashboardItemLayout implements DashboardItemLayout {
  const factory _DashboardItemLayout(
      {@JsonKey(name: 'w') required final int width,
      @JsonKey(name: 'h') required final int height,
      @JsonKey(name: 'min_W') required final int minWidth,
      @JsonKey(name: 'min_H') required final int minHeight,
      @JsonKey(name: 'max_W') final int? maxWidth,
      @JsonKey(name: 'max_H') final int? maxHeight,
      @JsonKey(name: 's_X') final int? startX,
      @JsonKey(name: 's_Y') final int? startY}) = _$DashboardItemLayoutImpl;

  factory _DashboardItemLayout.fromJson(Map<String, dynamic> json) =
      _$DashboardItemLayoutImpl.fromJson;

  @override
  @JsonKey(name: 'w')
  int get width;
  @override
  @JsonKey(name: 'h')
  int get height;
  @override
  @JsonKey(name: 'min_W')
  int get minWidth;
  @override
  @JsonKey(name: 'min_H')
  int get minHeight;
  @override
  @JsonKey(name: 'max_W')
  int? get maxWidth;
  @override
  @JsonKey(name: 'max_H')
  int? get maxHeight;
  @override
  @JsonKey(name: 's_X')
  int? get startX;
  @override
  @JsonKey(name: 's_Y')
  int? get startY;
  @override
  @JsonKey(ignore: true)
  _$$DashboardItemLayoutImplCopyWith<_$DashboardItemLayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
