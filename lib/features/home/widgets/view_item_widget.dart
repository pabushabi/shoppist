import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';

class ViewItemWidget extends StatelessWidget {
  final ShoppingItemModel item;

  const ViewItemWidget({Key? key, required this.item}) : super(key: key);

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
                Text(
                  'Name: ${item.name}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Count: ${item.amount}/${item.maxAmount}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Type',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ChoiceChip(
                    shape: const StadiumBorder(),
                    label: Text(item.type),
                    selected: false,
                    // selected: _value == index,
                    onSelected: (bool selected) {
                      // setState(() {
                      //   _value = selected ? index : null;
                      // });
                    },
                  ),
                ),
              ],
            ),
            // OutlinedButton(
            //   onPressed: () {
            //     log('${shoppingCubit.state.items}', name: 'save');
            //     createCubit.createItem(shoppingCubit);
            //     Navigator.of(context).pop();
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.all(12.0),
            //     child: Text('save'),
            //   ),
            // ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
