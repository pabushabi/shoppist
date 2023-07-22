import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';
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
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      title: widget.editingItem == null ? t.create_new : t.edit,
      body: [
        Row(
          children: [
            Text(
              '${t.name}:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
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
          children: [
            Text(
              '${t.current_count}:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 40),
            Expanded(
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
          children: [
            Text(
              '${t.max_count}:',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 70),
            Expanded(
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
          t.type,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          children: [
            ...List<Widget>.generate(
              6,
              (int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ChoiceChip(
                    shape: const StadiumBorder(),
                    label: Text('Item $index'),
                    selected: false,
                    // selected: _value == index,
                    onSelected: (bool selected) {
                      // setState(() {
                      //   _value = selected ? index : null;
                      // });
                    },
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ActionChip(
                backgroundColor: Colors.primaries[3].shade100,
                label: Text('+ ${t.add}'),
                shape: const StadiumBorder(),
                onPressed: () {},
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        OutlinedButton(
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
                  );
            } else {
              context.read<ShoppingListCubit>().editItem(
                    newItem: ShoppingItemModel(
                      name: _nameController.text,
                      amount: double.parse(_countController.text),
                      maxAmount: double.parse(_maxCountController.text),
                      type: widget.editingItem!.type,
                    ),
                    // oldIndex: context
                    //     .read<ShoppingListCubit>()
                    //     .state
                    //     .items
                    //     .indexOf(widget.editingItem!),
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
}
