import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/count_widget.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget(
    this.item, {
    super.key,
  });

  final ShoppingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.name,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(width: 10),
          CountWidget(
            item: item,
            needColor: false,
          ),
          const SizedBox(width: 2),
          IconButton(
            onPressed: () => context.read<ShoppingListCubit>().plusOne(item),
            onLongPress: () => context.read<ShoppingListCubit>().plusTen(item),
            icon: const Icon(Icons.plus_one),
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.green.withAlpha(150)),
            ),
          ),
          IconButton(
            onPressed: () => context.read<ShoppingListCubit>().plusAll(item),
            icon: const Icon(Icons.add_shopping_cart),
            style: ButtonStyle(
              backgroundColor:
                  WidgetStateProperty.all(Colors.green.withAlpha(150)),
            ),
          ),
        ],
      ),
    );
  }
}
