import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/repositories/shopping_list_repository.dart';
import 'package:shoppist/features/home/repositories/sort_repository.dart';
import 'package:uuid/uuid.dart';

part 'shopping_list_state.dart';

class ShoppingListCubit extends Cubit<ShoppingListState> {
  final ShoppingListRepository _repository;
  final SortRepository _sortRepository;

  ShoppingListCubit(this._repository, this._sortRepository)
      : super(ShoppingListState.initial());

  final _uuid = const Uuid();

  Future<void> getItems() async {
    if (getIt<PrefsUtils>().isFirstOpen()) {
      getIt<PrefsUtils>().setNotFirstOpen();
    }
    final savedSort = _sortRepository.getCurrentSort();
    emit(state.copyWith(sortModel: savedSort));
    var items = await _repository.getShoppingList();
    if (state.sortModel == SortModel.alphabetic) {
      items
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    }
    if (state.sortModel == SortModel.type) {
      items.sort(
        (a, b) {
          int type = a.tag?.name
                  .toLowerCase()
                  .compareTo(b.tag?.name.toLowerCase() ?? 'я') ??
              1;
          if (type != 0) {
            return type;
          } else {
            return a.name.toLowerCase().compareTo(b.name.toLowerCase());
          }
        },
      );
    }
    emit(
      state.copyWith(
        items: items,
        lastDeleted: state.lastDeleted,
      ),
    );
  }

  void setSort(SortModel sort) {
    emit(state.copyWith(sortModel: sort));
    _sortRepository.setCurrentSort(sort);
    getItems();
  }

  void addItem({
    required String name,
    required double count,
    double? maxCount,
    TagModel? tag,
    String? id,
  }) {
    final ShoppingItemModel item = ShoppingItemModel(
      id: id ?? _uuid.v4().split('-').last,
      name: name,
      amount: count,
      maxAmount: maxCount ?? count,
      tag: tag,
    );
    _repository.setShoppingListItem(item);
    getItems();
  }

  void removeItem(ShoppingItemModel item) {
    if (state.items.isNotEmpty) {
      if (state.items.contains(item)) {
        _repository.deleteShoppingListItem(item);
        getItems();
        emit(state.copyWith(lastDeleted: item));
      }
    } else {
      emit(state.copyWith(items: []));
    }
  }

  void returnDeleted() {
    if (state.lastDeleted != null) {
      addItem(
        id: state.lastDeleted!.id,
        name: state.lastDeleted!.name,
        count: state.lastDeleted!.amount,
        maxCount: state.lastDeleted!.maxAmount,
        tag: state.lastDeleted!.tag,
      );
    }
  }

  void editItem({required ShoppingItemModel newItem}) {
    _repository.setShoppingListItem(newItem);
    getItems();
  }

  void minusOne({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      id: state.items[index].id,
      name: state.items[index].name,
      amount: (state.items[index].amount - 1 > 0)
          ? state.items[index].amount - 1
          : 0,
      maxAmount: state.items[index].maxAmount,
      tag: state.items[index].tag,
    );
    editItem(newItem: newItem);
  }

  void plusOne({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      id: state.items[index].id,
      name: state.items[index].name,
      amount: state.items[index].amount + 1,
      maxAmount: state.items[index].maxAmount,
      tag: state.items[index].tag,
    );
    editItem(newItem: newItem);
  }

  void resetCount({required int index}) {
    final ShoppingItemModel newItem = ShoppingItemModel(
      id: state.items[index].id,
      name: state.items[index].name,
      amount: 0,
      maxAmount: state.items[index].maxAmount,
      tag: state.items[index].tag,
    );
    editItem(newItem: newItem);
  }
}
