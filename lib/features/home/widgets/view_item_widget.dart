import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/i18n/strings.g.dart';

class ViewItemWidget extends StatelessWidget {
  final int index;

  const ViewItemWidget({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingListCubit, ShoppingListState>(
      builder: (context, state) {
        return BottomSheetLayout(
          crossAxisAlignment: CrossAxisAlignment.start,
          body: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => context
                      .read<ShoppingListCubit>()
                      .resetCount(index: index),
                  icon: const Icon(Icons.exposure_zero),
                ),
                IconButton(
                  onPressed: () =>
                      context.read<ShoppingListCubit>().minusOne(index: index),
                  icon: const Icon(Icons.exposure_minus_1),
                ),
                IconButton(
                  onPressed: () =>
                      context.read<ShoppingListCubit>().plusOne(index: index),
                  icon: const Icon(Icons.exposure_plus_1),
                ),
                IconButton(
                  onPressed: () => showEditItemBottomSheet(
                    context,
                    state.items[index],
                  ),
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context
                        .read<ShoppingListCubit>()
                        .removeItem(state.items[index]);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            Text(
              '${t.name}: ${state.items.isNotEmpty ? state.items[index].name : t.deleted}',
              style: const TextStyle(fontSize: 16),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 10),
            Text(
              '${t.current_count}: ${state.items.isNotEmpty ? state.items[index].amount : 0}/${state.items.isNotEmpty ? state.items[index].maxAmount : 0}',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  t.type,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ChoiceChip(
                    shape: const StadiumBorder(),
                    label: Text(
                      state.items.isNotEmpty
                          ? state.items[index].type
                          : 'no type',
                    ),
                    selected: true,
                    onSelected: (bool selected) {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
