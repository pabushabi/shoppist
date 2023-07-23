import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/features/home/models/shopping_item.dart';
import 'package:shoppist/features/settings/blocs/family_code_cubit.dart';

abstract class ShoppingListRepository {
  Future<List<ShoppingItemModel>> getShoppingList();

  void setShoppingListItem(ShoppingItemModel item);

  void deleteShoppingListItem(ShoppingItemModel item);
}

class ShoppingListRepositoryImpl extends ShoppingListRepository {
  final FirebaseFirestore _firestore;

  ShoppingListRepositoryImpl(this._firestore);

  @override
  Future<List<ShoppingItemModel>> getShoppingList() async {
    final response = await _firestore
        .collection('family-${getIt<FamilyCodeCubit>().state.code}')
        .get();
    List<ShoppingItemModel> result = [];
    for (var element in response.docs) {
      result.add(ShoppingItemModel.fromJson(element.data()));
    }
    return result;
  }

  @override
  void setShoppingListItem(ShoppingItemModel item) {
    _firestore
        .collection('family-${getIt<FamilyCodeCubit>().state.code}')
        .doc(item.id)
        .set(item.toJson());
  }

  @override
  void deleteShoppingListItem(ShoppingItemModel item) {
    log('${item.type}-${item.name}');
    _firestore
        .collection('family-${getIt<FamilyCodeCubit>().state.code}')
        .doc(item.id)
        .delete();
  }
}
