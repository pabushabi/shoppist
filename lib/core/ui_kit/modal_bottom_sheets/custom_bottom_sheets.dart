import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';
import 'package:shoppist/features/home/widgets/create_new_item_widget.dart';
import 'package:shoppist/features/home/widgets/view_item_widget.dart';

Future basicBottomSheet(
  BuildContext context, {
  required Widget child,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    // backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) => child,
  );
}

Future<void> showCreateItemBottomSheet(BuildContext context) =>
    basicBottomSheet(context, child: const CreateOrEditItemWidget());

Future<void> showEditItemBottomSheet(
  BuildContext context,
  ShoppingItemModel item,
) =>
    basicBottomSheet(
      context,
      child: CreateOrEditItemWidget(
        editingItem: item,
      ),
    );

Future<void> showViewItemBottomSheet(
  BuildContext context, {
  required int index,
}) =>
    basicBottomSheet(context, child: ViewItemWidget(index: index));
