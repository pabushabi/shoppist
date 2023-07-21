part of 'shopping_list_cubit.dart';

class ShoppingListState extends Equatable {
  final List<ShoppingItemModel> items;
  final ShoppingItemModel? lastDeleted;

  const ShoppingListState(
    this.items, {
    this.lastDeleted,
  });

  ShoppingListState copyWith({
    List<ShoppingItemModel>? items,
    ShoppingItemModel? lastDeleted,
  }) =>
      ShoppingListState(
        items ?? this.items,
        lastDeleted: lastDeleted ?? this.lastDeleted,
      );

  factory ShoppingListState.initial() => const ShoppingListState([]);

  @override
  List<Object?> get props => [items, lastDeleted];
}
