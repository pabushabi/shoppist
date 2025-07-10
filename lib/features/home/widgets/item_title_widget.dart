import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/auto_size_text_widget.dart';
import 'package:shoppist/core/ui_kit/substrate_widget.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/count_widget.dart';

class ItemTitleWidget extends StatelessWidget {
  const ItemTitleWidget(
    this.item, {
    super.key,
  });

  final ShoppingItemModel item;

  @override
  Widget build(BuildContext context) {
    return SubstrateWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: AutoSizeTextWidget(
                item.name,
                minFontSize: 16,
                maxFontSize: 24,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          CountWidget(item: item, needColor: true),
        ],
      ),
    );
  }
}
