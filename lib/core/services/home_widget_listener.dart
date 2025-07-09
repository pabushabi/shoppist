import 'package:shoppist/features/home_widget/controllers/home_widget_controller.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home_widget/models/home_widget_data.dart';

void homeWidgetListener() {
  ShoppingListState prevState = getIt<ShoppingListCubit>().state;

  getIt<ShoppingListCubit>().stream.listen((state) {
    if (prevState.items != state.items) {
      var shouldSaveItems = state.items
          .where((element) => element.amount <= 1)
          .toList()
        ..sort((a, b) => a.amount.compareTo(b.amount));

      if (shouldSaveItems.isNotEmpty) {
        final items = shouldSaveItems
            .take(5)
            .map((el) => '${el.name}: ${el.amount}')
            .toList();
        final widgetData = HomeWidgetData.fromList(items);

        HomeWidgetController.updateWidget(widgetData);
      }
    }

    prevState = state;
  });
}
