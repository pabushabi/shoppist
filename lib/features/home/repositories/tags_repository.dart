import 'dart:convert';

import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/core/utils/prefs_utils.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/models/tag_model.dart';

abstract class TagsRepository {
  void saveTags(List<TagModel> tags);

  List<TagModel> getTags();

  void removeTag(TagModel tag);

  void removeAllTags();
}

class TagsRepositoryImpl extends TagsRepository {
  @override
  List<TagModel> getTags() {
    final items = getIt<PrefsUtils>().getTags();
    List<TagModel> tags = [];
    List<ShoppingItemModel> localShoppingItems =
        getIt<ShoppingListCubit>().state.items;
    if (items == null) {
      if (localShoppingItems.isNotEmpty) {
        for (var item in localShoppingItems) {
          if (item.tag != null) {
            tags.add(item.tag!);
          }
        }
      }
      return [];
    }
    for (var element in items) {
      tags.add(TagModel.fromJson(jsonDecode(element)));
    }
    if (localShoppingItems.isNotEmpty) {
      for (var item in localShoppingItems) {
        if (item.tag != null && !tags.contains(item.tag)) {
          tags.add(item.tag!);
        }
      }
    }
    return tags;
  }

  @override
  void saveTags(List<TagModel> tags) {
    List<String> items = [];
    for (var element in tags) {
      items.add(jsonEncode(element.toJson()));
    }
    getIt<PrefsUtils>().saveTags(items);
  }

  @override
  void removeAllTags() {
    getIt<PrefsUtils>().deleteTags();
  }

  @override
  void removeTag(TagModel tag) {
    List<TagModel> tags = getTags();
    tags.remove(tag);
    saveTags(tags);
  }
}
