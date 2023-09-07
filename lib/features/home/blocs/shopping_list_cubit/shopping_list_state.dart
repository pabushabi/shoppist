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

  factory ShoppingListState.initial() => const ShoppingListState([]);

  @override
  List<Object?> get props => [items, lastDeleted, sortModel];
}
