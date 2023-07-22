import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';
import 'package:shoppist/features/home/repositories/shopping_list_repository.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  final ShoppingListRepository _repository;

  ShoppingListCubit(this._repository) : super(ShoppingListState.initial());

  Future<void> getItems() async {
    if (getIt<PrefsUtils>().isFirstOpen()) {
      getIt<PrefsUtils>().setNotFirstOpen();
    }
    emit(state.copyWith(items: await _repository.getShoppingList()));
  }

  void addItem({
    required String name,
    required double count,
    double? maxCount,
    String? type,
  }) {
    final ShoppingItemModel item = ShoppingItemModel(
      name: name,
      amount: count,
      maxAmount: maxCount ?? count,
      type: type ?? 'no type',
    );
    _repository.setShoppingListItem(item);
    getItems();
  }

  void removeItem(ShoppingItemModel item) {
    if (state.items.isNotEmpty) {
      if (state.items.contains(item)) {
        _repository.deleteShoppingListItem(item);
        getItems();
      }
    } else {
      emit(state.copyWith(items: []));
    }
  }

  void returnDeleted() {
    if (state.lastDeleted != null) {
      addItem(
        name: state.lastDeleted!.name,
        count: state.lastDeleted!.amount,
        maxCount: state.lastDeleted!.maxAmount,
        type: state.lastDeleted!.type,
      );
    }
  }

  void editItem({required ShoppingItemModel newItem}) {
    _repository.setShoppingListItem(newItem);
    getItems();
  }

  void minusOne({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      name: state.items[index].name,
      amount: (state.items[index].amount - 1 > 0)
          ? state.items[index].amount - 1
          : 0,
      maxAmount: state.items[index].maxAmount,
      type: state.items[index].type,
    );
    editItem(newItem: newItem);
  }

  void plusOne({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      name: state.items[index].name,
      amount: state.items[index].amount + 1,
      maxAmount: state.items[index].maxAmount,
      type: state.items[index].type,
    );
    editItem(newItem: newItem);
  }

  void resetCount({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      name: state.items[index].name,
      amount: 0,
      maxAmount: state.items[index].maxAmount,
      type: state.items[index].type,
    );
    editItem(newItem: newItem);
  }
}
