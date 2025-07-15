import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';

class PlusMinusWidget extends StatelessWidget {
  const PlusMinusWidget(this.item, {
    required this.index,
    super.key,
  });
  final ShoppingItemModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .41,
          child: IconButton(
            iconSize: 40,
            onPressed: () =>
                context.read<ShoppingListCubit>().minusOne(item),
            onLongPress: () =>
                context.read<ShoppingListCubit>().resetCount(item),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.red.shade100.withAlpha(150),
              ),
            ),
            icon: const Icon(Icons.exposure_minus_1),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .41,
          child: IconButton(
            iconSize: 40,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Colors.green.shade100.withAlpha(150),
              ),
            ),
            onPressed: () =>
                context.read<ShoppingListCubit>().plusOne(item),
            onLongPress: () => context.read<ShoppingListCubit>().plusTen(item),
            icon: const Icon(Icons.exposure_plus_1),
          ),
        ),
      ],
    );
  }
}
