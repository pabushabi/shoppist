import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => context
                          .read<ShoppingListCubit>()
                          .minusOne(index: index),
                      icon: const Icon(Icons.exposure_minus_1),
                    ),
                    IconButton(
                      onPressed: () => context
                          .read<ShoppingListCubit>()
                          .plusOne(index: index),
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
                Row(
                  children: [
                    Text(
                      'name: ${state.items.isNotEmpty ? state.items[index].name : 'deleted'}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'count: ${state.items.isNotEmpty ? state.items[index].amount : 0}/${state.items.isNotEmpty ? state.items[index].maxAmount : 0}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      'Type',
                      style: TextStyle(fontSize: 20),
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
            ),
          ),
        );
      },
    );
  }
}
