import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/core/ui_kit/substrate_widget.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/shop/widgets/item_widget.dart';
import 'package:shoppist/i18n/strings.g.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      title: context.t.shop.list,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      body: [
        SubstrateWidget(
          child: BlocBuilder<ShoppingListCubit, ShoppingListState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.t.shop.low,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    ...state.lowItems.map((item) => ItemWidget(item)),
                    const Divider(),
                    if (state.mediumItems.isNotEmpty)
                      Text(
                        context.t.shop.medium,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ...state.mediumItems.map(
                      (item) => ItemWidget(item),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
