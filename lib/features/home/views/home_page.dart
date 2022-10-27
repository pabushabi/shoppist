import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';

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
          child: BlocBuilder<ShoppingListCubit, ShoppingListState>(
            builder: (context, state) {
              return Column(
                children: List.generate(
                  state.items.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors
                                .primaries[index < 17 ? index : 17].shade100,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            builder: (context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Center(
                                  child: Text(state.items[index].name),
                                ),
                              );
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors
                              .primaries[index < 17 ? index : 17].shade100,
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              state.items[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text('${state.items[index].amount}/'
                                '${state.items[index].maxAmount}'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<ShoppingListCubit>().addItem(ShoppingItemModel(
                    name: Random().nextInt(10000).toString(),
                    amount: 1,
                    maxAmount: 2,
                    type: 'type',
                  ));
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
    );
  }
}
