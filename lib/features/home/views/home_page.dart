import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/create_item_cubit.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';
import 'package:shoppist/features/home/widgets/create_new_item_widget.dart';
import 'package:shoppist/features/home/widgets/item_widget.dart';
import 'package:shoppist/features/home/widgets/view_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('shoppist'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<ShoppingListCubit, ShoppingListState>(
            builder: (context, state) {
              return Column(
                children: List.generate(
                  state.items.length,
                  (index) => ItemWidget(
                    item: state.items[index],
                    index: index,
                    onPressed: () => context.read<ShoppingListCubit>().editItem(
                          newItem: ShoppingItemModel(
                            name: state.items[index].name,
                            amount: state.items[index].amount - 1,
                            maxAmount: state.items[index].maxAmount,
                            type: state.items[index].type,
                          ),
                          oldIndex: index,
                        ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                builder: (_) => CreateNewItemWidget(
                  shoppingCubit: BlocProvider.of<ShoppingListCubit>(context),
                  createCubit: BlocProvider.of<CreateItemCubit>(context),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<ShoppingListCubit>().removeItem();
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
