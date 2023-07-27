part of 'tags_cubit.dart';

class TagsState extends Equatable {
  final List<TagModel> tags;

  const TagsState(this.tags);

  TagsState copyWith({List<TagModel>? tags}) => TagsState(tags ?? this.tags);

  @override
  List<Object?> get props => [tags];
}
