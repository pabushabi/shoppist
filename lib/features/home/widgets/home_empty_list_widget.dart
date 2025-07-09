import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/i18n/strings.g.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class HomeEmptyListWidget extends StatefulWidget {
  const HomeEmptyListWidget({super.key});

  @override
  State<HomeEmptyListWidget> createState() => _HomeEmptyListWidgetState();
}

class _HomeEmptyListWidgetState extends State<HomeEmptyListWidget> {
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Translations.of(context).empty),
            TextButton(
              onPressed: () => showCreateItemBottomSheet(context),
              child: Text(t.create),
            ),
          ],
        ),
      ],
    );
  }
}
