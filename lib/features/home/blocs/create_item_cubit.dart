import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';

part 'create_item_state.dart';

part 'create_item_cubit.freezed.dart';

@injectable
class CreateItemCubit extends Cubit<CreateItemState> {
  CreateItemCubit() : super(CreateItemState(ShoppingItemModel.empty()));

  ShoppingItemModel item = ShoppingItemModel.empty();
  String name = '';
  int amount = 0;

  createItem(ShoppingListCubit cubit) {
    // cubit.addItem(item);
    cubit.addItem(ShoppingItemModel(
      name: name,
      amount: 0,
      maxAmount: amount,
      type: 'type',
    ));
  }

  nameChanged(String name) {
    name = name;
    // item.name = name;
  }

  countChanged(String count) {
    amount = int.parse(count);
    // item.maxAmount = int.parse(count);
  }

  typeChanged(String type) {}

  typeAdded(String type) {}
}
