import 'package:flutter/material.dart';

class NamedTextInput extends StatelessWidget {
  const NamedTextInput({
    required this.name,
    required this.controller,
    this.keyboardType,
    this.textFieldWidth,
    this.onEditingComplete,
    super.key,
  });

  final String name;
  final TextEditingController controller;
  final double? textFieldWidth;
  final TextInputType? keyboardType;
  final VoidCallback? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hint: Text(
          name,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        filled: true,
        fillColor: Colors.grey.withAlpha(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      onChanged: (_) => onEditingComplete,
    );
  }
}
