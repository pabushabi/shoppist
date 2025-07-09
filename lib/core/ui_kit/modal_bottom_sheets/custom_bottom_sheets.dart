import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/widgets/create_or_edit_item_widget.dart';
import 'package:shoppist/features/home/widgets/edit_tags_widget.dart';
import 'package:shoppist/features/home/widgets/view_item_widget.dart';
import 'package:shoppist/features/settings/widgets/settings_widget.dart';

Future basicBottomSheet(
  BuildContext context, {
  required Widget child,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool isCard = true,
  RouteSettings? routeSettings,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    routeSettings: routeSettings,
    backgroundColor: isCard ? Colors.transparent : null,
    elevation: isCard ? 0 : null,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
    ),
    builder: (context) {
      return isCard
          ? Padding(
              padding: const EdgeInsets.all(8),
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: child,
              ),
            )
          : child;
    },
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
      child: CreateOrEditItemWidget(editingItem: item),
    );

Future<void> showViewItemBottomSheet(
  BuildContext context, {
  required int index,
}) =>
    basicBottomSheet(context, child: ViewItemWidget(index: index));

Future<void> showSettingsBottomSheet(BuildContext context) =>
    basicBottomSheet(context, child: const SettingsWidget());

Future<void> showTagEditBottomSheet(BuildContext context) =>
    basicBottomSheet(context, child: const EditTagsWidget());
