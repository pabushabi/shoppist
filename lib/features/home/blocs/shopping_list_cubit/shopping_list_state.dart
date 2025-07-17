part of 'shopping_list_cubit.dart';

class ShoppingListState extends Equatable {
  final List<ShoppingItemModel> items;
  final ShoppingItemModel? lastDeleted;
  final SortModel sortModel;

  const ShoppingListState(
    this.items, {
    this.lastDeleted,
    this.sortModel = SortModel.none,
  });

  List<ShoppingItemModel> get lowItems =>
      items.where((item) => item.amount <= item.maxAmount / 2).toList()
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  List<ShoppingItemModel> get mediumItems => items
      .where(
        (item) =>
            (item.amount > item.maxAmount / 2) &&
            (item.amount <= item.maxAmount * .8),
      )
      .toList()
    ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

  ShoppingListState copyWith({
    List<ShoppingItemModel>? items,
    ShoppingItemModel? lastDeleted,
    SortModel? sortModel,
  }) =>
      ShoppingListState(
        items ?? this.items,
        lastDeleted: lastDeleted ?? this.lastDeleted,
        sortModel: sortModel ?? this.sortModel,
      );

  ShoppingListState resetLastDelete() => ShoppingListState(
        items,
        sortModel: sortModel,
        lastDeleted: null,
      );

  factory ShoppingListState.initial() => const ShoppingListState([]);

  @override
  List<Object?> get props => [items, lastDeleted, sortModel];
}
