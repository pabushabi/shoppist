import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/widgets/add_tag_dialog.dart';
import 'package:shoppist/i18n/strings.g.dart';

class ViewItemWidget extends StatelessWidget {
  final int index;

  const ViewItemWidget({
    required this.index,
    super.key,
  });

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
              '${t.name}: ${(index < state.items.length) ? state.items[index].name : t.deleted}',
              style: const TextStyle(fontSize: 16),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 10),
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                children: [
                  TextSpan(text: '${t.current_count} '),
                  TextSpan(
                    text: state.items[index].amountFormatted,
                    style: TextStyle(
                      color: state.items[index].amount <= 0
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                  TextSpan(
                    text: '/${state.items[index].maxAmountFormatted}',
                  ),
                ],
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            if (state.items[index].tag != null)
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ChoiceChip(
                  shape: const StadiumBorder(),
                  selected: true,
                  onSelected: (bool selected) {},
                  selectedColor: state.items[index].tag?.color.withOpacity(.7),
                  label: Text(
                    state.items.isNotEmpty
                        ? state.items[index].tag?.name ?? ''
                        : 'no type',
                  ),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ActionChip(
                  backgroundColor: Colors.accents[14],
                  label: Text('+ ${t.add}'),
                  shape: const StadiumBorder(),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddTagDialog(
                        item: state.items[index],
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
