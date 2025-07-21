import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/core/ui_kit/substrate_widget.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/description_widget.dart';
import 'package:shoppist/features/home/widgets/item_title_widget.dart';
import 'package:shoppist/features/home/widgets/plus_minus_widget.dart';
import 'package:shoppist/features/home/widgets/tags_widget.dart';

class ViewItemWidget extends StatelessWidget {
  final ShoppingItemModel item;

  const ViewItemWidget(
    this.item, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListState>(
      builder: (context, state) {
        final currentItem = state.items.firstWhere((el) => el.id == item.id);

        return BottomSheetLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          body: [
            ItemTitleWidget(currentItem),
            const SizedBox(height: 10),
            SubstrateWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionWidget(currentItem),
                  // const SizedBox(height: 10),
                  TagsWidget(currentItem),
                  const SizedBox(height: 20),
                  PlusMinusWidget(currentItem, index: 0),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
