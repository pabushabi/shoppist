// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_item_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateItemState {
  ShoppingItemModel get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateItemStateCopyWith<CreateItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateItemStateCopyWith<$Res> {
  factory $CreateItemStateCopyWith(
          CreateItemState value, $Res Function(CreateItemState) then) =
      _$CreateItemStateCopyWithImpl<$Res, CreateItemState>;
  @useResult
  $Res call({ShoppingItemModel item});
}

/// @nodoc
class _$CreateItemStateCopyWithImpl<$Res, $Val extends CreateItemState>
    implements $CreateItemStateCopyWith<$Res> {
  _$CreateItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ShoppingItemModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateItemStateCopyWith<$Res>
    implements $CreateItemStateCopyWith<$Res> {
  factory _$$_CreateItemStateCopyWith(
          _$_CreateItemState value, $Res Function(_$_CreateItemState) then) =
      __$$_CreateItemStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ShoppingItemModel item});
}

/// @nodoc
class __$$_CreateItemStateCopyWithImpl<$Res>
    extends _$CreateItemStateCopyWithImpl<$Res, _$_CreateItemState>
    implements _$$_CreateItemStateCopyWith<$Res> {
  __$$_CreateItemStateCopyWithImpl(
      _$_CreateItemState _value, $Res Function(_$_CreateItemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_CreateItemState(
      null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as ShoppingItemModel,
    ));
  }
}

/// @nodoc

class _$_CreateItemState implements _CreateItemState {
  const _$_CreateItemState(this.item);

  @override
  final ShoppingItemModel item;

  @override
  String toString() {
    return 'CreateItemState(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateItemState &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateItemStateCopyWith<_$_CreateItemState> get copyWith =>
      __$$_CreateItemStateCopyWithImpl<_$_CreateItemState>(this, _$identity);
}

abstract class _CreateItemState implements CreateItemState {
  const factory _CreateItemState(final ShoppingItemModel item) =
      _$_CreateItemState;

  @override
  ShoppingItemModel get item;
  @override
  @JsonKey(ignore: true)
  _$$_CreateItemStateCopyWith<_$_CreateItemState> get copyWith =>
      throw _privateConstructorUsedError;
}
