import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/repositories/tags_repository.dart';

part 'tags_state.dart';

class TagsCubit extends Cubit<TagsState> {
  final TagsRepository _repository;

  TagsCubit(this._repository) : super(const TagsState([])) {
    init();
  }

  void init() {
    emit(state.copyWith(tags: _repository.getTags()));
  }

  void addTag(String name, {Color? color}) {
    final newTag = TagModel(name: name, color: color ?? Colors.blue);
    _repository.saveTags([newTag, ...state.tags]);
    emit(state.copyWith(tags: [newTag, ...state.tags]));
  }

  void editTag(TagModel tag, {String? newName, Color? newColor}) {
    if (!state.tags.contains(tag)) return;
    final tags = state.tags;
    tags.replaceRange(
      tags.indexOf(tag),
      tags.indexOf(tag) + 1,
      [TagModel(name: newName ?? tag.name, color: newColor ?? tag.color)],
    );
    _repository.removeTag(tag);
    _repository.saveTags(tags);
    emit(state.copyWith(tags: tags));
  }

  void removeTag(TagModel tag) {
    if (state.tags.isNotEmpty && state.tags.contains(tag)) {
      final List<TagModel> newTags = [
        ...state.tags.getRange(0, state.tags.indexOf(tag)),
        ...state.tags.getRange(state.tags.indexOf(tag) + 1, state.tags.length),
      ];
      _repository.removeTag(tag);
      emit(state.copyWith(tags: newTags));
    }
  }
}
