import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppist/features/home/blocs/shopping_list_cubit/shopping_list_cubit.dart';
import 'package:shoppist/features/settings/blocs/family_code_cubit.dart';
import 'package:shoppist/i18n/strings.g.dart';

class EditFamilyCodeDialog extends StatelessWidget {
  final TextEditingController newCodeController;

  const EditFamilyCodeDialog({
    required this.newCodeController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              t.settings.enter_code,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              t.settings.note_code,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: newCodeController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final code = await Clipboard.getData(Clipboard.kTextPlain);
                    newCodeController.text = code?.text ?? '';
                  },
                  icon: const Icon(Icons.paste),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(t.cancel),
                ),
                const SizedBox(width: 10),
                FilledButton(
                  onPressed: () {
                    context
                        .read<FamilyCodeCubit>()
                        .changeCode(newCodeController.text);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    context.read<ShoppingListCubit>().getItems();
                  },
                  child: Text(t.save),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
