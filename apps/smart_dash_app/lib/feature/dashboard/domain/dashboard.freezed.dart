// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Dashboard {
  String get key;
  String get title;
  List<Token> get tokens;
  List<Identity> get ids;
  DashboardLayout get mobile;
  DashboardLayout get tablet;
  DashboardLayout get desktop;
  DashboardLayout get mobileLarge;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardCopyWith<Dashboard> get copyWith =>
      _$DashboardCopyWithImpl<Dashboard>(this as Dashboard, _$identity);

  /// Serializes this Dashboard to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Dashboard &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other.tokens, tokens) &&
            const DeepCollectionEquality().equals(other.ids, ids) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.tablet, tablet) || other.tablet == tablet) &&
            (identical(other.desktop, desktop) || other.desktop == desktop) &&
            (identical(other.mobileLarge, mobileLarge) ||
                other.mobileLarge == mobileLarge));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      title,
      const DeepCollectionEquality().hash(tokens),
      const DeepCollectionEquality().hash(ids),
      mobile,
      tablet,
      desktop,
      mobileLarge);

  @override
  String toString() {
    return 'Dashboard(key: $key, title: $title, tokens: $tokens, ids: $ids, mobile: $mobile, tablet: $tablet, desktop: $desktop, mobileLarge: $mobileLarge)';
  }
}

/// @nodoc
abstract mixin class $DashboardCopyWith<$Res> {
  factory $DashboardCopyWith(Dashboard value, $Res Function(Dashboard) _then) =
      _$DashboardCopyWithImpl;
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
class _$DashboardCopyWithImpl<$Res> implements $DashboardCopyWith<$Res> {
  _$DashboardCopyWithImpl(this._self, this._then);

  final Dashboard _self;
  final $Res Function(Dashboard) _then;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _self.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      ids: null == ids
          ? _self.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<Identity>,
      mobile: null == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      tablet: null == tablet
          ? _self.tablet
          : tablet // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      desktop: null == desktop
          ? _self.desktop
          : desktop // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      mobileLarge: null == mobileLarge
          ? _self.mobileLarge
          : mobileLarge // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
    ));
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get mobile {
    return $DashboardLayoutCopyWith<$Res>(_self.mobile, (value) {
      return _then(_self.copyWith(mobile: value));
    });
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get tablet {
    return $DashboardLayoutCopyWith<$Res>(_self.tablet, (value) {
      return _then(_self.copyWith(tablet: value));
    });
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get desktop {
    return $DashboardLayoutCopyWith<$Res>(_self.desktop, (value) {
      return _then(_self.copyWith(desktop: value));
    });
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get mobileLarge {
    return $DashboardLayoutCopyWith<$Res>(_self.mobileLarge, (value) {
      return _then(_self.copyWith(mobileLarge: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Dashboard extends Dashboard {
  const _Dashboard(
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
  factory _Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);

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

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardCopyWith<_Dashboard> get copyWith =>
      __$DashboardCopyWithImpl<_Dashboard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dashboard &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'Dashboard(key: $key, title: $title, tokens: $tokens, ids: $ids, mobile: $mobile, tablet: $tablet, desktop: $desktop, mobileLarge: $mobileLarge)';
  }
}

/// @nodoc
abstract mixin class _$DashboardCopyWith<$Res>
    implements $DashboardCopyWith<$Res> {
  factory _$DashboardCopyWith(
          _Dashboard value, $Res Function(_Dashboard) _then) =
      __$DashboardCopyWithImpl;
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
class __$DashboardCopyWithImpl<$Res> implements _$DashboardCopyWith<$Res> {
  __$DashboardCopyWithImpl(this._self, this._then);

  final _Dashboard _self;
  final $Res Function(_Dashboard) _then;

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Dashboard(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      tokens: null == tokens
          ? _self._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<Token>,
      ids: null == ids
          ? _self._ids
          : ids // ignore: cast_nullable_to_non_nullable
              as List<Identity>,
      mobile: null == mobile
          ? _self.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      tablet: null == tablet
          ? _self.tablet
          : tablet // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      desktop: null == desktop
          ? _self.desktop
          : desktop // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
      mobileLarge: null == mobileLarge
          ? _self.mobileLarge
          : mobileLarge // ignore: cast_nullable_to_non_nullable
              as DashboardLayout,
    ));
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get mobile {
    return $DashboardLayoutCopyWith<$Res>(_self.mobile, (value) {
      return _then(_self.copyWith(mobile: value));
    });
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get tablet {
    return $DashboardLayoutCopyWith<$Res>(_self.tablet, (value) {
      return _then(_self.copyWith(tablet: value));
    });
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get desktop {
    return $DashboardLayoutCopyWith<$Res>(_self.desktop, (value) {
      return _then(_self.copyWith(desktop: value));
    });
  }

  /// Create a copy of Dashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<$Res> get mobileLarge {
    return $DashboardLayoutCopyWith<$Res>(_self.mobileLarge, (value) {
      return _then(_self.copyWith(mobileLarge: value));
    });
  }
}

/// @nodoc
mixin _$DashboardLayout {
  @JsonKey(name: 'slotCount')
  int get slotCount;
  @JsonKey(name: 'slotHeight')
  double get slotHeight;
  @JsonKey(name: 'items')
  List<DashboardItem> get items;

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardLayoutCopyWith<DashboardLayout> get copyWith =>
      _$DashboardLayoutCopyWithImpl<DashboardLayout>(
          this as DashboardLayout, _$identity);

  /// Serializes this DashboardLayout to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardLayout &&
            (identical(other.slotCount, slotCount) ||
                other.slotCount == slotCount) &&
            (identical(other.slotHeight, slotHeight) ||
                other.slotHeight == slotHeight) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slotCount, slotHeight,
      const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'DashboardLayout(slotCount: $slotCount, slotHeight: $slotHeight, items: $items)';
  }
}

/// @nodoc
abstract mixin class $DashboardLayoutCopyWith<$Res> {
  factory $DashboardLayoutCopyWith(
          DashboardLayout value, $Res Function(DashboardLayout) _then) =
      _$DashboardLayoutCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'slotCount') int slotCount,
      @JsonKey(name: 'slotHeight') double slotHeight,
      @JsonKey(name: 'items') List<DashboardItem> items});
}

/// @nodoc
class _$DashboardLayoutCopyWithImpl<$Res>
    implements $DashboardLayoutCopyWith<$Res> {
  _$DashboardLayoutCopyWithImpl(this._self, this._then);

  final DashboardLayout _self;
  final $Res Function(DashboardLayout) _then;

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slotCount = null,
    Object? slotHeight = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      slotCount: null == slotCount
          ? _self.slotCount
          : slotCount // ignore: cast_nullable_to_non_nullable
              as int,
      slotHeight: null == slotHeight
          ? _self.slotHeight
          : slotHeight // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DashboardItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardLayout implements DashboardLayout {
  const _DashboardLayout(
      {@JsonKey(name: 'slotCount') required this.slotCount,
      @JsonKey(name: 'slotHeight') required this.slotHeight,
      @JsonKey(name: 'items') required final List<DashboardItem> items})
      : _items = items;
  factory _DashboardLayout.fromJson(Map<String, dynamic> json) =>
      _$DashboardLayoutFromJson(json);

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

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardLayoutCopyWith<_DashboardLayout> get copyWith =>
      __$DashboardLayoutCopyWithImpl<_DashboardLayout>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardLayoutToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardLayout &&
            (identical(other.slotCount, slotCount) ||
                other.slotCount == slotCount) &&
            (identical(other.slotHeight, slotHeight) ||
                other.slotHeight == slotHeight) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slotCount, slotHeight,
      const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'DashboardLayout(slotCount: $slotCount, slotHeight: $slotHeight, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$DashboardLayoutCopyWith<$Res>
    implements $DashboardLayoutCopyWith<$Res> {
  factory _$DashboardLayoutCopyWith(
          _DashboardLayout value, $Res Function(_DashboardLayout) _then) =
      __$DashboardLayoutCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'slotCount') int slotCount,
      @JsonKey(name: 'slotHeight') double slotHeight,
      @JsonKey(name: 'items') List<DashboardItem> items});
}

/// @nodoc
class __$DashboardLayoutCopyWithImpl<$Res>
    implements _$DashboardLayoutCopyWith<$Res> {
  __$DashboardLayoutCopyWithImpl(this._self, this._then);

  final _DashboardLayout _self;
  final $Res Function(_DashboardLayout) _then;

  /// Create a copy of DashboardLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? slotCount = null,
    Object? slotHeight = null,
    Object? items = null,
  }) {
    return _then(_DashboardLayout(
      slotCount: null == slotCount
          ? _self.slotCount
          : slotCount // ignore: cast_nullable_to_non_nullable
              as int,
      slotHeight: null == slotHeight
          ? _self.slotHeight
          : slotHeight // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<DashboardItem>,
    ));
  }
}

/// @nodoc
mixin _$DashboardItem {
  @JsonKey(name: 'item_id')
  String get key;
  @JsonKey(name: 'layout')
  DashboardItemLayout get layout;

  /// Create a copy of DashboardItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardItemCopyWith<DashboardItem> get copyWith =>
      _$DashboardItemCopyWithImpl<DashboardItem>(
          this as DashboardItem, _$identity);

  /// Serializes this DashboardItem to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardItem &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.layout, layout) || other.layout == layout));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, layout);

  @override
  String toString() {
    return 'DashboardItem(key: $key, layout: $layout)';
  }
}

/// @nodoc
abstract mixin class $DashboardItemCopyWith<$Res> {
  factory $DashboardItemCopyWith(
          DashboardItem value, $Res Function(DashboardItem) _then) =
      _$DashboardItemCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') String key,
      @JsonKey(name: 'layout') DashboardItemLayout layout});

  $DashboardItemLayoutCopyWith<$Res> get layout;
}

/// @nodoc
class _$DashboardItemCopyWithImpl<$Res>
    implements $DashboardItemCopyWith<$Res> {
  _$DashboardItemCopyWithImpl(this._self, this._then);

  final DashboardItem _self;
  final $Res Function(DashboardItem) _then;

  /// Create a copy of DashboardItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? layout = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      layout: null == layout
          ? _self.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as DashboardItemLayout,
    ));
  }

  /// Create a copy of DashboardItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardItemLayoutCopyWith<$Res> get layout {
    return $DashboardItemLayoutCopyWith<$Res>(_self.layout, (value) {
      return _then(_self.copyWith(layout: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardItem implements DashboardItem {
  const _DashboardItem(
      {@JsonKey(name: 'item_id') required this.key,
      @JsonKey(name: 'layout') required this.layout});
  factory _DashboardItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardItemFromJson(json);

  @override
  @JsonKey(name: 'item_id')
  final String key;
  @override
  @JsonKey(name: 'layout')
  final DashboardItemLayout layout;

  /// Create a copy of DashboardItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardItemCopyWith<_DashboardItem> get copyWith =>
      __$DashboardItemCopyWithImpl<_DashboardItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardItemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardItem &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.layout, layout) || other.layout == layout));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, layout);

  @override
  String toString() {
    return 'DashboardItem(key: $key, layout: $layout)';
  }
}

/// @nodoc
abstract mixin class _$DashboardItemCopyWith<$Res>
    implements $DashboardItemCopyWith<$Res> {
  factory _$DashboardItemCopyWith(
          _DashboardItem value, $Res Function(_DashboardItem) _then) =
      __$DashboardItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') String key,
      @JsonKey(name: 'layout') DashboardItemLayout layout});

  @override
  $DashboardItemLayoutCopyWith<$Res> get layout;
}

/// @nodoc
class __$DashboardItemCopyWithImpl<$Res>
    implements _$DashboardItemCopyWith<$Res> {
  __$DashboardItemCopyWithImpl(this._self, this._then);

  final _DashboardItem _self;
  final $Res Function(_DashboardItem) _then;

  /// Create a copy of DashboardItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? layout = null,
  }) {
    return _then(_DashboardItem(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      layout: null == layout
          ? _self.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as DashboardItemLayout,
    ));
  }

  /// Create a copy of DashboardItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardItemLayoutCopyWith<$Res> get layout {
    return $DashboardItemLayoutCopyWith<$Res>(_self.layout, (value) {
      return _then(_self.copyWith(layout: value));
    });
  }
}

/// @nodoc
mixin _$DashboardItemLayout {
  @JsonKey(name: 'w')
  int get width;
  @JsonKey(name: 'h')
  int get height;
  @JsonKey(name: 'min_W')
  int get minWidth;
  @JsonKey(name: 'min_H')
  int get minHeight;
  @JsonKey(name: 'max_W')
  int? get maxWidth;
  @JsonKey(name: 'max_H')
  int? get maxHeight;
  @JsonKey(name: 's_X')
  int? get startX;
  @JsonKey(name: 's_Y')
  int? get startY;

  /// Create a copy of DashboardItemLayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DashboardItemLayoutCopyWith<DashboardItemLayout> get copyWith =>
      _$DashboardItemLayoutCopyWithImpl<DashboardItemLayout>(
          this as DashboardItemLayout, _$identity);

  /// Serializes this DashboardItemLayout to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DashboardItemLayout &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, minWidth,
      minHeight, maxWidth, maxHeight, startX, startY);

  @override
  String toString() {
    return 'DashboardItemLayout(width: $width, height: $height, minWidth: $minWidth, minHeight: $minHeight, maxWidth: $maxWidth, maxHeight: $maxHeight, startX: $startX, startY: $startY)';
  }
}

/// @nodoc
abstract mixin class $DashboardItemLayoutCopyWith<$Res> {
  factory $DashboardItemLayoutCopyWith(
          DashboardItemLayout value, $Res Function(DashboardItemLayout) _then) =
      _$DashboardItemLayoutCopyWithImpl;
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
class _$DashboardItemLayoutCopyWithImpl<$Res>
    implements $DashboardItemLayoutCopyWith<$Res> {
  _$DashboardItemLayoutCopyWithImpl(this._self, this._then);

  final DashboardItemLayout _self;
  final $Res Function(DashboardItemLayout) _then;

  /// Create a copy of DashboardItemLayout
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      minWidth: null == minWidth
          ? _self.minWidth
          : minWidth // ignore: cast_nullable_to_non_nullable
              as int,
      minHeight: null == minHeight
          ? _self.minHeight
          : minHeight // ignore: cast_nullable_to_non_nullable
              as int,
      maxWidth: freezed == maxWidth
          ? _self.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeight: freezed == maxHeight
          ? _self.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      startX: freezed == startX
          ? _self.startX
          : startX // ignore: cast_nullable_to_non_nullable
              as int?,
      startY: freezed == startY
          ? _self.startY
          : startY // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DashboardItemLayout implements DashboardItemLayout {
  const _DashboardItemLayout(
      {@JsonKey(name: 'w') required this.width,
      @JsonKey(name: 'h') required this.height,
      @JsonKey(name: 'min_W') required this.minWidth,
      @JsonKey(name: 'min_H') required this.minHeight,
      @JsonKey(name: 'max_W') this.maxWidth,
      @JsonKey(name: 'max_H') this.maxHeight,
      @JsonKey(name: 's_X') this.startX,
      @JsonKey(name: 's_Y') this.startY});
  factory _DashboardItemLayout.fromJson(Map<String, dynamic> json) =>
      _$DashboardItemLayoutFromJson(json);

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

  /// Create a copy of DashboardItemLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DashboardItemLayoutCopyWith<_DashboardItemLayout> get copyWith =>
      __$DashboardItemLayoutCopyWithImpl<_DashboardItemLayout>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DashboardItemLayoutToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DashboardItemLayout &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, width, height, minWidth,
      minHeight, maxWidth, maxHeight, startX, startY);

  @override
  String toString() {
    return 'DashboardItemLayout(width: $width, height: $height, minWidth: $minWidth, minHeight: $minHeight, maxWidth: $maxWidth, maxHeight: $maxHeight, startX: $startX, startY: $startY)';
  }
}

/// @nodoc
abstract mixin class _$DashboardItemLayoutCopyWith<$Res>
    implements $DashboardItemLayoutCopyWith<$Res> {
  factory _$DashboardItemLayoutCopyWith(_DashboardItemLayout value,
          $Res Function(_DashboardItemLayout) _then) =
      __$DashboardItemLayoutCopyWithImpl;
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
class __$DashboardItemLayoutCopyWithImpl<$Res>
    implements _$DashboardItemLayoutCopyWith<$Res> {
  __$DashboardItemLayoutCopyWithImpl(this._self, this._then);

  final _DashboardItemLayout _self;
  final $Res Function(_DashboardItemLayout) _then;

  /// Create a copy of DashboardItemLayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_DashboardItemLayout(
      width: null == width
          ? _self.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      minWidth: null == minWidth
          ? _self.minWidth
          : minWidth // ignore: cast_nullable_to_non_nullable
              as int,
      minHeight: null == minHeight
          ? _self.minHeight
          : minHeight // ignore: cast_nullable_to_non_nullable
              as int,
      maxWidth: freezed == maxWidth
          ? _self.maxWidth
          : maxWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      maxHeight: freezed == maxHeight
          ? _self.maxHeight
          : maxHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      startX: freezed == startX
          ? _self.startX
          : startX // ignore: cast_nullable_to_non_nullable
              as int?,
      startY: freezed == startY
          ? _self.startY
          : startY // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
