import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/add_tag_dialog.dart';
import 'package:shoppist/i18n/strings.g.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget(this.item, {super.key});

  final ShoppingItemModel item;

  @override
  Widget build(BuildContext context) {
    if (item.tag != null) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          shape: const StadiumBorder(),
          selected: true,
          onSelected: (bool selected) {},
          selectedColor: item.tag?.color.withAlpha(100),
          label: Text(item.tag?.name ?? ''),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: ActionChip(
          backgroundColor: Colors.grey.withAlpha(100),
          label: Text(t.add),
          avatar: Icon(Icons.add, color: Theme.of(context).hintColor,),
          shape: const StadiumBorder(),
          side: BorderSide.none,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AddTagDialog(
                item: item,
              ),
            );
          },
        ),
      );
    }
  }
}
