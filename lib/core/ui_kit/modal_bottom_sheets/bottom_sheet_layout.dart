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
        padding: padding?.copyWith(
              top: 10,
              bottom: needKeyboardPadding
                  ? MediaQuery.of(context).viewInsets.bottom
                  : null,
            ) ??
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
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).highlightColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (title != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
