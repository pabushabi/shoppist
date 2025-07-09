import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/i18n/strings.g.dart';

class AddOrEditTagDialog extends StatefulWidget {
  final TagModel? tagToEdit;

  const AddOrEditTagDialog({this.tagToEdit, super.key});

  @override
  State<AddOrEditTagDialog> createState() => _AddOrEditTagDialogState();
}

class _AddOrEditTagDialogState extends State<AddOrEditTagDialog> {
  late final TextEditingController nameController = (widget.tagToEdit == null)
      ? TextEditingController()
      : TextEditingController(text: widget.tagToEdit!.name);
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
              widget.tagToEdit == null ? t.tag.add : t.edit,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
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
                    if (widget.tagToEdit == null) {
                      context.read<TagsCubit>().addTag(
                            nameController.text,
                            color: chosenColor,
                          );
                    } else {
                      context.read<TagsCubit>().editTag(
                            widget.tagToEdit!,
                            newName: nameController.text,
                            newColor: chosenColor,
                          );
                      context.read<TagsCubit>().getTags();
                    }
                    Navigator.pop(context);
                    // context.read<ShoppingListCubit>().getItems();
                  },
                  child: Text(t.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
