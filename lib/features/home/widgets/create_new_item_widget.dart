import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoppist/features/home/blocs/create_item_cubit.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit.dart';

class CreateNewItemWidget extends StatelessWidget {
  final ShoppingListCubit shoppingCubit;
  final CreateItemCubit createCubit;

  const CreateNewItemWidget({
    required this.shoppingCubit,
    required this.createCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      createCubit.nameChanged(value);
                    },
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
                const Text(
                  'Count:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      createCubit.countChanged(value);
                    },
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
            const Text(
              'Type',
              style: TextStyle(
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
                ).toList(),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ActionChip(
                    backgroundColor: Colors.primaries[3].shade100,
                    label: const Text('+ Add'),
                    shape: const StadiumBorder(),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () {
                log('${shoppingCubit.state.items}', name: 'save');
                createCubit.createItem(shoppingCubit);
                Navigator.of(context).pop();
              },
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('save'),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
