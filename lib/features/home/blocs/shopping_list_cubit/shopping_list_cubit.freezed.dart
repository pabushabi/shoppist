// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shopping_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShoppingListState {
  List<ShoppingItemModel> get items => throw _privateConstructorUsedError;
  ShoppingItemModel? get lastDeleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShoppingListStateCopyWith<ShoppingListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShoppingListStateCopyWith<$Res> {
  factory $ShoppingListStateCopyWith(
          ShoppingListState value, $Res Function(ShoppingListState) then) =
      _$ShoppingListStateCopyWithImpl<$Res, ShoppingListState>;
  @useResult
  $Res call({List<ShoppingItemModel> items, ShoppingItemModel? lastDeleted});
}

/// @nodoc
class _$ShoppingListStateCopyWithImpl<$Res, $Val extends ShoppingListState>
    implements $ShoppingListStateCopyWith<$Res> {
  _$ShoppingListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? lastDeleted = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItemModel>,
      lastDeleted: freezed == lastDeleted
          ? _value.lastDeleted
          : lastDeleted // ignore: cast_nullable_to_non_nullable
              as ShoppingItemModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShoppingListStateCopyWith<$Res>
    implements $ShoppingListStateCopyWith<$Res> {
  factory _$$_ShoppingListStateCopyWith(_$_ShoppingListState value,
          $Res Function(_$_ShoppingListState) then) =
      __$$_ShoppingListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ShoppingItemModel> items, ShoppingItemModel? lastDeleted});
}

/// @nodoc
class __$$_ShoppingListStateCopyWithImpl<$Res>
    extends _$ShoppingListStateCopyWithImpl<$Res, _$_ShoppingListState>
    implements _$$_ShoppingListStateCopyWith<$Res> {
  __$$_ShoppingListStateCopyWithImpl(
      _$_ShoppingListState _value, $Res Function(_$_ShoppingListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? lastDeleted = freezed,
  }) {
    return _then(_$_ShoppingListState(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ShoppingItemModel>,
      lastDeleted: freezed == lastDeleted
          ? _value.lastDeleted
          : lastDeleted // ignore: cast_nullable_to_non_nullable
              as ShoppingItemModel?,
    ));
  }
}

/// @nodoc

class _$_ShoppingListState implements _ShoppingListState {
  const _$_ShoppingListState(final List<ShoppingItemModel> items,
      {this.lastDeleted})
      : _items = items;

  final List<ShoppingItemModel> _items;
  @override
  List<ShoppingItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final ShoppingItemModel? lastDeleted;

  @override
  String toString() {
    return 'ShoppingListState(items: $items, lastDeleted: $lastDeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShoppingListState &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.lastDeleted, lastDeleted) ||
                other.lastDeleted == lastDeleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), lastDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShoppingListStateCopyWith<_$_ShoppingListState> get copyWith =>
      __$$_ShoppingListStateCopyWithImpl<_$_ShoppingListState>(
          this, _$identity);
}

abstract class _ShoppingListState implements ShoppingListState {
  const factory _ShoppingListState(final List<ShoppingItemModel> items,
      {final ShoppingItemModel? lastDeleted}) = _$_ShoppingListState;

  @override
  List<ShoppingItemModel> get items;
  @override
  ShoppingItemModel? get lastDeleted;
  @override
  @JsonKey(ignore: true)
  _$$_ShoppingListStateCopyWith<_$_ShoppingListState> get copyWith =>
      throw _privateConstructorUsedError;
}
