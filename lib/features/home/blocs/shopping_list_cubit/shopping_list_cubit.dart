import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';

part 'shopping_list_state.dart';

part 'shopping_list_cubit.freezed.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit() : super(ShoppingListState.initial());

  void addItem({
    required String name,
    required int count,
    int? maxCount,
    String? type,
  }) {
    final ShoppingItemModel item = ShoppingItemModel(
      name: name,
      amount: count,
      maxAmount: maxCount ?? count,
      type: type ?? 'no type',
    );
    emit(state.copyWith(items: [item, ...state.items]));
  }

  void removeItem(ShoppingItemModel item) {
    if (state.items.isNotEmpty) {
      if (state.items.contains(item)) {
        final List<ShoppingItemModel> newItems = [
          ...state.items.getRange(0, state.items.indexOf(item)),
          ...state.items
              .getRange(state.items.indexOf(item) + 1, state.items.length),
        ];
        emit(state.copyWith(items: newItems, lastDeleted: item));
      }
    } else {
      emit(state.copyWith(items: []));
    }
  }

  void editItem({required ShoppingItemModel newItem, required int oldIndex}) {
    final List<ShoppingItemModel> newList = state.items.toList();
    newList.replaceRange(oldIndex, oldIndex + 1, [newItem]);
    emit(state.copyWith(items: newList));
  }

  void minusOne({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      name: state.items[index].name,
      amount: state.items[index].amount - 1,
      maxAmount: state.items[index].maxAmount,
      type: state.items[index].type,
    );
    editItem(newItem: newItem, oldIndex: index);
  }

  void plusOne({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      name: state.items[index].name,
      amount: state.items[index].amount + 1,
      maxAmount: state.items[index].maxAmount,
      type: state.items[index].type,
    );
    editItem(newItem: newItem, oldIndex: index);
  }
}
