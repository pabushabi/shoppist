import 'package:flutter/material.dart';

class SubstrateWidget extends StatelessWidget {
  const SubstrateWidget({
    required this.child,
    this.padding,
    super.key,
  });

  final Widget child;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(20),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: child,
    );
  }
}
