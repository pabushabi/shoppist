import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shoppist/features/settings/blocs/family_code/family_code_cubit.dart';
import 'package:shoppist/features/settings/widgets/edit_family_code_dialog.dart';
import 'package:shoppist/features/settings/widgets/settings_tile_widget.dart';
import 'package:shoppist/i18n/strings.g.dart';

class FamilyTile extends StatefulWidget {
  const FamilyTile({super.key});

  @override
  State<FamilyTile> createState() => _FamilyTileState();
}

class _FamilyTileState extends State<FamilyTile> {
  late final TextEditingController _familyCodeController;
  final TextEditingController _newCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SettingsTileWidget(
      title: context.t.settings.family_code,
      rightWidget: Row(
        children: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => EditFamilyCodeDialog(
                newCodeController: _newCodeController,
              ),
            ),
            child: BlocBuilder<FamilyCodeCubit, FamilyCodeState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Text(
                      state.code ?? context.t.push.not_set,
                      style: TextStyle(
                        fontSize: 18,
                        color: Theme.of(context).hintColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.edit,
                      color: Theme.of(context).hintColor,
                    ),
                  ],
                );
              },
            ),
          ),
          IconButton(
            onPressed: () => SharePlus.instance
                .share(ShareParams(text: _familyCodeController.text)),
            icon: Icon(
              Icons.share,
              color: Theme.of(context).hintColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _familyCodeController = TextEditingController(
      text: context.read<FamilyCodeCubit>().state.code,
    );
  }
}
