import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/core/ui_kit/substrate_widget.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/widgets/item_tags_widget.dart';
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
    _updateButton();
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      body: [
        SubstrateWidget(
          child: Column(
            children: [
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .41,
                      child: NamedTextInput(
                        name: t.current_count,
                        controller: _countController,
                        textFieldWidth: 140,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .41,
                      child: NamedTextInput(
                        name: t.max_count,
                        controller: _maxCountController,
                        textFieldWidth: 140,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ItemTagsWidget(
                initialValue: _value ?? -1,
                onSelected: (se) {
                  _value = se;
                  setState(() {});
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  onPressed: isButtonEnabled ? saveItem : null,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(t.save),
                  ),
                ),
              ),
            ],
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
}
