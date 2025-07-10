import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/utils/color_utils.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';

class CountWidget extends StatelessWidget {
  final ShoppingItemModel item;
  final bool needColor;

  const CountWidget({
    required this.item,
    this.needColor = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: needColor
                ? getColorForValue(item.amount / item.maxAmount)
                : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                ),
                children: [
                  TextSpan(
                    text: item.amountFormatted,
                  ),
                  TextSpan(
                    text: '/${item.maxAmountFormatted}',
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
          ),
        );
      },
    );
  }
}
