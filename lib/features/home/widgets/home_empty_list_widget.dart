import 'package:flutter/material.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/custom_bottom_sheets.dart';

class HomeEmptyListWidget extends StatelessWidget {
  const HomeEmptyListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Its too empty here, maybe create a new one?'),
          TextButton(
            onPressed: () => showCreateItemBottomSheet(context),
            child: const Text('create'),
          ),
        ],
      ),
    );
  }
}
