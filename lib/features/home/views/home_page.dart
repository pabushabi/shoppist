import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/widgets/home_empty_list_widget.dart';
import 'package:shoppist/features/home/widgets/home_items_list_widget.dart';

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
        child: BlocConsumer<ShoppingListCubit, ShoppingListState>(
          listenWhen: (prev, next) => (prev.lastDeleted != next.lastDeleted),
          listener: (context, state) {
            if (state.lastDeleted != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Deleted ${state.lastDeleted!.name}'),
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: 'undo',
                    onPressed: () => context.read<ShoppingListCubit>().addItem(
                          name: state.lastDeleted!.name,
                          count: state.lastDeleted!.amount,
                          type: state.lastDeleted!.type,
                        ),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.items.isEmpty) {
              return const HomeEmptyListWidget();
            }
            return HomeItemsListWidget(items: state.items);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showCreateItemBottomSheet(context),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
