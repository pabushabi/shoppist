import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/i18n/strings.g.dart';

class DeleteItemDialog extends StatelessWidget {
  const DeleteItemDialog({
    required this.item,
    required this.isDeleted,
    super.key,
  });

  final ShoppingItemModel item;
  final Function(bool deleted) isDeleted;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.t.deleting,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${context.t.wantToDelete} ${item.name}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    isDeleted(false);
                    Navigator.pop(context);
                  },
                  child: Text(t.cancel),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {
                    isDeleted(true);
                    Navigator.pop(context);
                  },
                  child: Text(t.delete),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
