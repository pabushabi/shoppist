import 'package:flutter/material.dart';

class BottomSheetLayout extends StatelessWidget {
  final List<Widget> body;
  final String? title;
  final EdgeInsets? padding;
  final bool needKeyboardPadding;
  final CrossAxisAlignment crossAxisAlignment;

  const BottomSheetLayout({
    required this.body,
    super.key,
    this.title,
    this.padding,
    this.needKeyboardPadding = true,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: padding ??
            EdgeInsets.only(
              top: 20,
              left: 40,
              right: 40,
              bottom: needKeyboardPadding
                  ? MediaQuery.of(context).viewInsets.bottom + 40
                  : 40,
            ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            Center(
              child: Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ...body,
          ],
        ),
      ),
    );
  }
}
