import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';
import 'package:shoppist/features/home/widgets/item_widget.dart';

class HomeItemsListWidget extends StatelessWidget {
  final List<ShoppingItemModel> items;

  const HomeItemsListWidget({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: List.generate(
          items.length,
          (index) => ItemWidget(
            item: items[index],
            index: index,
          ),
        ),
      ),
    );
  }
}
