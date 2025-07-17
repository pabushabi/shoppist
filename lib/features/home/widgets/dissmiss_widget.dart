import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/delete_item_dialog.dart';
import 'package:shoppist/features/home/widgets/item_list_widget.dart';

class DismissWidget extends StatelessWidget {
  const DismissWidget({
    required this.item,
    super.key,
  });

  final ShoppingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            color: Colors.blue.withAlpha(100),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.edit,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      secondaryBackground: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20.0),
          decoration: BoxDecoration(
            color: Colors.red.withAlpha(100),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.delete,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          log('deleting');
          context.read<ShoppingListCubit>().removeItem(item);
        }
      },
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          showEditItemBottomSheet(context, item);
          return false;
        } else if (direction == DismissDirection.endToStart) {
          var needToDelete = false;
          await showDialog(
            context: context,
            builder: (context) => DeleteItemDialog(
              item: item,
              isDeleted: (deleted) {
                if (deleted) {
                  needToDelete = true;
                }
              },
            ),
          );
          return needToDelete;
        }
        return false;
      },
      child: ItemListWidget(
        item: item,
      ),
    );
  }
}
