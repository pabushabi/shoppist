import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shoppist/core/services/injection.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/home/models/shopping_item_model.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/repositories/tags_repository.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<TagsState> {
  final TagsRepository _repository;

  TagsCubit(this._repository) : super(const TagsState([])) {
    getTags();
  }

  void getTags() {
    emit(state.copyWith(tags: _repository.getTags()));
  }

  void addTag(String name, {Color? color}) {
    final newTag = TagModel(name: name, color: color ?? Colors.blue);
    _repository.saveTags([newTag, ...state.tags]);
    emit(state.copyWith(tags: [newTag, ...state.tags]));
  }

  void editTag(TagModel oldTag, {String? newName, Color? newColor}) {
    if (!state.tags.contains(oldTag)) return;
    final tags = state.tags;
    final newTag = TagModel(
      name: newName ?? oldTag.name,
      color: newColor ?? oldTag.color,
    );
    tags.replaceRange(
      tags.indexOf(oldTag),
      tags.indexOf(oldTag) + 1,
      [newTag],
    );
    final items = getIt<ShoppingListCubit>().state.items;
    for (var item in items) {
      if (item.tag == oldTag) {
        getIt<ShoppingListCubit>().editItem(
          newItem: ShoppingItemModel(
            id: item.id,
            name: item.name,
            amount: item.amount,
            maxAmount: item.maxAmount,
            tag: newTag,
          ),
        );
      }
    }
    _repository.removeTag(oldTag);
    _repository.saveTags(tags);
    emit(state.copyWith(tags: tags));
  }

  void removeTag(TagModel tag) {
    if (state.tags.isNotEmpty && state.tags.contains(tag)) {
      final List<TagModel> newTags = [
        ...state.tags.getRange(0, state.tags.indexOf(tag)),
        ...state.tags.getRange(state.tags.indexOf(tag) + 1, state.tags.length),
      ];
      final items = getIt<ShoppingListCubit>().state.items;
      for (var item in items) {
        if (item.tag == tag) {
          getIt<ShoppingListCubit>().editItem(
            newItem: ShoppingItemModel(
              id: item.id,
              name: item.name,
              amount: item.amount,
              maxAmount: item.maxAmount,
              tag: null,
            ),
          );
        }
      }
      _repository.removeTag(tag);
      emit(state.copyWith(tags: newTags));
    }
  }
}
