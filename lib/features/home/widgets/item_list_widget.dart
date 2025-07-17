import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/count_widget.dart';

class ItemListWidget extends StatelessWidget {
  final ShoppingItemModel item;

  const ItemListWidget({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () => showViewItemBottomSheet(context, item: item),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
          ),
          width: MediaQuery.of(context).size.width,
          height: 68,
          child: Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: item.tag?.color.withAlpha(100) ??
                        Colors.white.withAlpha(100),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  child: Text(
                    item.name,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              CountWidget(
                item: item,
                needColor: true,
              ),
              const SizedBox(width: 6),
              IconButton(
                onPressed: () =>
                    context.read<ShoppingListCubit>().minusOne(item),
                onLongPress: () => context.read<ShoppingListCubit>().resetCount(item),
                icon: const Icon(Icons.exposure_minus_1_rounded),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all(Colors.red.withAlpha(150)),
                ),
              ),
              const SizedBox(width: 7),
            ],
          ),
        ),
      ),
    );
  }
}
