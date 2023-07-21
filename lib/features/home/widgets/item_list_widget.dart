import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';

class ItemListWidget extends StatelessWidget {
  final ShoppingItemModel item;
  final int index;

  const ItemListWidget({
    required this.item,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => showViewItemBottomSheet(context, index: index),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.primaries[index < 17 ? index : 17].shade100,
          ),
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              Expanded(
                child: Text(
                  item.name,
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),
                    children: [
                      TextSpan(
                        text: '${item.amount}',
                        style: TextStyle(
                          color: item.amount == 0 ? Colors.red : Colors.green,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const TextSpan(text: '/'),
                      TextSpan(
                        text: '${item.maxAmount}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: () =>
                    context.read<ShoppingListCubit>().minusOne(index: index),
                icon: const Icon(Icons.exposure_minus_1_rounded),
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
        ),
      ),
    );
  }
}
