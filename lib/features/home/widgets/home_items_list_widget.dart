import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/item_list_widget.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class HomeItemsListWidget extends StatefulWidget {
  final List<ShoppingItemModel> items;

  const HomeItemsListWidget({required this.items, super.key});

  @override
  State<StatefulWidget> createState() => _HomeItemsListWidgetState();
}
class _HomeItemsListWidgetState extends State<HomeItemsListWidget> {
  final _controller = StreamController<SwipeRefreshState>.broadcast();

  @override
  Widget build(BuildContext context) {
    return SwipeRefresh.adaptive(
      stateStream: _controller.stream,
      onRefresh: () {
        context.read<ShoppingListCubit>().getItems();
        _controller.sink.add(SwipeRefreshState.hidden);
      },
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              widget.items.length,
              (index) => ItemListWidget(
                item: widget.items[index],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
