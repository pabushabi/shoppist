import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/widgets/add_or_edit_tag_dialog.dart';
import 'package:shoppist/i18n/strings.g.dart';

class AddTagDialog extends StatefulWidget {
  final ShoppingItemModel item;

  const AddTagDialog({
    required this.item,
    super.key,
  });

  @override
  State<AddTagDialog> createState() => _AddTagDialogState();
}

class _AddTagDialogState extends State<AddTagDialog> {
  int? _value;

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
            const SizedBox(height: 20),
            BlocBuilder<TagsCubit, TagsState>(
              buildWhen: (prev, next) => prev.tags != next.tags,
              builder: (context, state) {
                return Wrap(
                  children: [
                    ...List<Widget>.generate(
                      state.tags.length,
                      (int index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            key: GlobalKey(),
                            onLongPressStart: (details) => _showContextMenu(
                              context,
                              details.globalPosition,
                              state.tags[index],
                            ),
                            child: ChoiceChip(
                              key: UniqueKey(),
                              shape: const StadiumBorder(),
                              label: Text(state.tags[index].name),
                              selectedColor:
                                  state.tags[index].color.withOpacity(.5),
                              selected: _value == index,
                              onSelected: (bool selected) {
                                setState(() {
                                  _value = selected ? index : null;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ActionChip(
                        backgroundColor: Colors.accents[14],
                        label: Text('+ ${t.add}'),
                        shape: const StadiumBorder(),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => const AddOrEditTagDialog(),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
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
                  onPressed: _value != null
                      ? () {
                          final tag =
                              context.read<TagsCubit>().state.tags[_value!];
                          context.read<ShoppingListCubit>().editItem(
                                newItem: widget.item.copyWith(tag: tag),
                              );

                          Navigator.pop(context);
                        }
                      : null,
                  child: Text(t.save),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showContextMenu(BuildContext context, Offset offset, TagModel tag) {
    HapticFeedback.vibrate();
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(offset, offset),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: 'edit',
          child: Text(t.edit),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text(t.delete),
        ),
      ],
    ).then((selectedOption) {
      if (selectedOption != null) {
        switch (selectedOption) {
          case 'edit':
            showDialog(
              context: context,
              builder: (context) => AddOrEditTagDialog(tagToEdit: tag),
            );
            break;
          case 'delete':
            context.read<TagsCubit>().removeTag(tag);
            break;
        }
      }
    });
  }
}
