import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';

part 'shopping_list_state.dart';

part 'shopping_list_cubit.freezed.dart';

@injectable
class ShoppingListCubit extends Cubit<ShoppingListState> {
  ShoppingListCubit() : super(ShoppingListState.initial());

  addItem(ShoppingItemModel item) {
    emit(state.copyWith(items: [item, ...state.items]));
  }

  removeItem() {
    if (state.items.isNotEmpty) {
      emit(state.copyWith(
          items: state.items.getRange(0, state.items.length - 1).toList()));
    } else {
      emit(state.copyWith(items: []));
    }
  }

  editItem({required ShoppingItemModel newItem, required int oldIndex}) {
    var newList = state.items.toList();
    newList.replaceRange(oldIndex, oldIndex + 1, [newItem]);
    emit(state.copyWith(items: newList));
  }
}
