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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: textFieldWidth ?? 230,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
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
            onChanged: (_) => onEditingComplete,
          ),
        ),
      ],
    );
  }
}
