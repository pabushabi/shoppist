import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/i18n/strings.g.dart';

class AddTagDialog extends StatefulWidget {
  const AddTagDialog({Key? key}) : super(key: key);

  @override
  State<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  final TextEditingController nameController = TextEditingController();
  MaterialColor? chosenColor;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.tag.add,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.tag.enter_name,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.tag.choose_color,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                DropdownButton2(
                  value: chosenColor,
                  onChanged: (val) => setState(() => chosenColor = val),
                  items: List.generate(
                    Colors.primaries.length,
                    (index) => DropdownMenuItem(
                      value: Colors.primaries[index],
                      child: Text(
                        ColorTexts.texts[index],
                        style: TextStyle(
                          color: Colors.primaries[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(t.cancel),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {
                    context.read<TagsCubit>().addTag(
                          nameController.text,
                          color: chosenColor,
                        );
                    Navigator.pop(context);
                    // context.read<ShoppingListCubit>().getItems();
                  },
                  child: Text(t.save),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
