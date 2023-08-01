import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/widgets/add_or_edit_tag_dialog.dart';
import 'package:shoppist/i18n/strings.g.dart';

class CreateOrEditItemWidget extends StatefulWidget {
  final ShoppingItemModel? editingItem;

  const CreateOrEditItemWidget({
    Key? key,
    this.editingItem,
  }) : super(key: key);

  @override
  State<CreateOrEditItemWidget> createState() => CreateOrEditItemWidgetState();
}

class CreateOrEditItemWidgetState extends State<CreateOrEditItemWidget> {
  late final TextEditingController _nameController;
  late final TextEditingController _countController;
  late final TextEditingController _maxCountController;

  int? _value;

  @override
  void initState() {
    super.initState();
    _nameController = widget.editingItem == null
        ? TextEditingController()
        : TextEditingController(text: widget.editingItem!.name);
    _countController = widget.editingItem == null
        ? TextEditingController()
        : TextEditingController(text: '${widget.editingItem!.amount}');
    _maxCountController = widget.editingItem == null
        ? TextEditingController()
        : TextEditingController(text: '${widget.editingItem!.maxAmount}');
  }

  @override
  void dispose() {
    super.dispose();
    _countController.dispose();
    _nameController.dispose();
    _maxCountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      title: widget.editingItem == null ? t.create_new : t.edit,
      body: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${t.name}:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 230,
              child: TextField(
                controller: _nameController,
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
              t.current_count,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 140,
              child: TextField(
                controller: _countController,
                keyboardType: TextInputType.number,
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
              t.max_count,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 140,
              child: TextField(
                controller: _maxCountController,
                keyboardType: TextInputType.number,
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
        Text(
          t.tag.tag,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
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
        FilledButton(
          onPressed: () {
            if (widget.editingItem == null) {
              context.read<ShoppingListCubit>().addItem(
                    name: _nameController.text,
                    count: double.parse(_countController.text),
                    maxCount: double.parse(
                      _maxCountController.text.isNotEmpty
                          ? _maxCountController.text
                          : _countController.text,
                    ),
                    tag: _value != null
                        ? TagModel(
                            name: context
                                .read<TagsCubit>()
                                .state
                                .tags[_value!]
                                .name,
                            color: context
                                .read<TagsCubit>()
                                .state
                                .tags[_value!]
                                .color,
                          )
                        : null,
                  );
            } else {
              context.read<ShoppingListCubit>().editItem(
                    newItem: ShoppingItemModel(
                      id: widget.editingItem!.id,
                      name: _nameController.text,
                      amount: double.parse(_countController.text),
                      maxAmount: double.parse(_maxCountController.text),
                      tag: _value != null
                          ? context.read<TagsCubit>().state.tags[_value!]
                          : widget.editingItem!.tag,
                    ),
                  );
            }
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(t.save),
          ),
        ),
      ],
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
