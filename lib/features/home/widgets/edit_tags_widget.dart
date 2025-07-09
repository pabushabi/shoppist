// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shoppist/core/constants/constants.dart';
import 'package:shoppist/core/ui_kit/modal_bottom_sheets/bottom_sheet_layout.dart';
import 'package:shoppist/features/home/blocs/tags_cubit/tags_cubit.dart';
import 'package:shoppist/i18n/strings.g.dart';

class EditTagsWidget extends StatefulWidget {
  const EditTagsWidget({super.key});

  @override
  State<EditTagsWidget> createState() => _EditTagsWidgetState();
}

class _EditTagsWidgetState extends State<EditTagsWidget> {
  List<Color?> tagColors = [];

  @override
  Widget build(BuildContext context) {
    return BottomSheetLayout(
      title: t.tag.menu,
      body: [
        BlocBuilder<TagsCubit, TagsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: state.tags.length,
                  itemBuilder: (context, index) {
                    tagColors.add(state.tags[index].color);
                    return Row(
                      children: [
                        Text('"${state.tags[index].name}"'),
                        const Spacer(),
                        FilledButton(
                          // style: (), TODO
                          onPressed: () {},
                          child: Text('${state.tags[index].color}'),
                        ),
                        // DropdownButton2(
                        //   value: tagColors[index],
                        //   onChanged: (val) =>
                        //       setState(() => tagColors[index] = val),
                        //   items: List.generate(
                        //     Colors.primaries.length,
                        //     (index) => DropdownMenuItem(
                        //       value: Colors.primaries[index],
                        //       child: Text(
                        //         ColorTexts.texts[index],
                        //         style: TextStyle(
                        //           color: Colors.primaries[index],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
