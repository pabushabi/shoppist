import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/widgets/add_or_edit_tag_dialog.dart';
import 'package:shoppist/features/home/widgets/named_text_input.dart';
import 'package:shoppist/i18n/strings.g.dart';

class CreateOrEditItemWidget extends StatefulWidget {
  final ShoppingItemModel? editingItem;

  const CreateOrEditItemWidget({
    super.key,
    this.editingItem,
  });

  @override
  State<CreateOrEditItemWidget> createState() => CreateOrEditItemWidgetState();
}

class CreateOrEditItemWidgetState extends State<CreateOrEditItemWidget> {
  late final TextEditingController _nameController;
  late final TextEditingController _descController;
  late final TextEditingController _countController;
  late final TextEditingController _maxCountController;

  int? _value;

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.editingItem?.name);
    _descController =
        TextEditingController(text: widget.editingItem?.description);
    _countController =
        TextEditingController(text: widget.editingItem?.amount.toString());
    _maxCountController =
        TextEditingController(text: widget.editingItem?.maxAmount.toString());

    if (widget.editingItem != null && widget.editingItem?.tag != null) {
      _value = context
          .read<TagsCubit>()
          .state
          .tags
          .indexOf(widget.editingItem!.tag!);
    }
    _nameController.addListener(_updateButton);
    _descController.addListener(_updateButton);
    _countController.addListener(_updateButton);
    _maxCountController.addListener(_updateButton);
  }

  void _updateButton() {
    isButtonEnabled = [
      _nameController.text,
      _descController.text,
      _countController.text,
      _maxCountController.text,
    ].every((el) => el.trim().isNotEmpty);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _countController.dispose();
    _nameController.dispose();
    _descController.dispose();
    _maxCountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      title: widget.editingItem == null ? t.create_new : t.edit,
      body: [
        NamedTextInput(
          name: t.name,
          controller: _nameController,
          textFieldWidth: 230,
        ),
        const SizedBox(height: 10),
        NamedTextInput(
          name: t.desc,
          controller: _descController,
          textFieldWidth: 230,
        ),
        const SizedBox(height: 10),
        NamedTextInput(
          name: t.current_count,
          controller: _countController,
          textFieldWidth: 140,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        NamedTextInput(
          name: t.max_count,
          controller: _maxCountController,
          textFieldWidth: 140,
          keyboardType: TextInputType.number,
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
                              state.tags[index].color.withAlpha(100),
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
          onPressed: isButtonEnabled ? saveItem : null,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(t.save),
          ),
        ),
      ],
    );
  }

  void saveItem() {
    final tags = context.read<TagsCubit>().state.tags;
    final shoppingCubit = context.read<ShoppingListCubit>();

    if (widget.editingItem == null) {
      shoppingCubit.addItem(
        name: _nameController.text,
        description: _descController.text,
        count: double.parse(_countController.text),
        maxCount: double.parse(
          _maxCountController.text.isNotEmpty
              ? _maxCountController.text
              : _countController.text,
        ),
        tag: _value != null
            ? TagModel(
                name: tags[_value!].name,
                color: tags[_value!].color,
              )
            : null,
      );
    } else {
      shoppingCubit.editItem(
        newItem: ShoppingItemModel(
          id: widget.editingItem!.id,
          name: _nameController.text,
          description: _descController.text,
          amount: double.parse(_countController.text),
          maxAmount: double.parse(_maxCountController.text),
          tag: _value != null ? tags[_value!] : null,
        ),
      );
    }
    Navigator.of(context).pop();
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
