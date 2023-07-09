part of 'shopping_list_cubit.dart';

@freezed
class ShoppingListState with _$ShoppingListState {
  const factory ShoppingListState(
    List<ShoppingItemModel> items, {
    ShoppingItemModel? lastDeleted,
  }) = _ShoppingListState;

  factory ShoppingListState.initial() => const ShoppingListState([]);
}