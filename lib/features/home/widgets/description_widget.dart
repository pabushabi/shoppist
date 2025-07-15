import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/i18n/strings.g.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget(
    this.item, {
    super.key,
  });

  final ShoppingItemModel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.description ?? t.couldBeDesc,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          IconButton(
            onPressed: () => showEditItemBottomSheet(
              context,
              item,
            ),
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
