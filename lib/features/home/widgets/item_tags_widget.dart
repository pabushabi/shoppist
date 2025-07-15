import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/core/ui_kit/substrate_widget.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/features/home/models/tag_model.dart';
import 'package:shoppist/features/home/widgets/add_or_edit_tag_dialog.dart';
import 'package:shoppist/i18n/strings.g.dart';

class ItemTagsWidget extends StatefulWidget {
  const ItemTagsWidget({
    required this.onSelected,
    required this.initialValue,
    super.key,
  });

  final Function(int? selected) onSelected;
  final int initialValue;

  @override
  State<ItemTagsWidget> createState() => _ItemTagsWidgetState();
}

class _ItemTagsWidgetState extends State<ItemTagsWidget> {
  int? _value;

  @override
  Widget build(BuildContext context) {
    return SubstrateWidget(
      child: Column(
        children: [
          Text(
            context.t.tag.tag,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<TagsCubit, TagsState>(
            buildWhen: (prev, next) => prev.tags != next.tags,
            builder: (context, state) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  spacing: 2,
                  children: [
                    ...List<Widget>.generate(
                      state.tags.length,
                          (int index) {
                        return GestureDetector(
                          key: GlobalKey(),
                          onLongPressStart: (details) => _showContextMenu(
                            context,
                            details.globalPosition,
                            state.tags[index],
                          ),
                          child: ChoiceChip(
                            key: UniqueKey(),
                            shape: const StadiumBorder(),
                            label: Text(state.tags[index].name),
                            selectedColor:
                            state.tags[index].color.withAlpha(100),
                            selected: (_value == null)
                                ? widget.initialValue == index
                                : _value == index,
                            onSelected: (bool selected) {
                              setState(() {
                                _value = selected ? index : null;
                              });
                              widget.onSelected(_value);
                            },
                          ),
                        );
                      },
                    ),
                    ActionChip(
                      backgroundColor: Colors.accents[14].withAlpha(100),
                      label: Text('+ ${t.add}'),
                      shape: const StadiumBorder(),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AddOrEditTagDialog(),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showContextMenu(BuildContext context, Offset offset, TagModel tag) {
    HapticFeedback.vibrate();
    final RenderBox overlay =
    Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(offset, offset),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position,
      items: [
        PopupMenuItem(
          value: 'edit',
          child: Text(t.edit),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Text(t.delete),
        ),
      ],
    ).then((selectedOption) {
      if (selectedOption != null) {
        switch (selectedOption) {
          case 'edit':
            showDialog(
              context: context,
              builder: (context) => AddOrEditTagDialog(tagToEdit: tag),
            );
            break;
          case 'delete':
            context.read<TagsCubit>().removeTag(tag);
            break;
        }
      }
    });
  }
}
