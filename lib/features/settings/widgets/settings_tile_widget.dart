import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    required this.title,
    required this.rightWidget,
    super.key,
  });

  final String title;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(),
        rightWidget,
      ],
    );
  }
}
