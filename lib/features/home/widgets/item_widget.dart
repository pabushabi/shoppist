import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';
import 'package:shoppist/features/home/widgets/view_item_widget.dart';

class ItemWidget extends StatelessWidget {
  final ShoppingItemModel item;
  final int index;
  final VoidCallback onPressed;

  const ItemWidget({
    Key? key,
    required this.item,
    required this.index,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              // backgroundColor:
              //     Colors.primaries[index < 17 ? index : 17].shade100,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              builder: (context) {
                return ViewItemWidget(item: item);
              });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.primaries[index < 17 ? index : 17].shade100,
          ),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 30),
              Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 22,
                ),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: '${item.amount}',
                      style: TextStyle(
                        color: item.amount == 0 ? Colors.red : Colors.green,
                      ),
                    ),
                    const TextSpan(text: '/'),
                    TextSpan(
                      text: '${item.maxAmount}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: onPressed,
                icon: const Icon(Icons.exposure_minus_1_rounded),
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                ),
              ),
              const SizedBox(width: 30),
            ],
          ),
        ),
      ),
    );
  }
}
