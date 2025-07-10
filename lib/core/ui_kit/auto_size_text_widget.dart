import 'package:flutter/material.dart';

class AutoSizeTextWidget extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final TextStyle? style;
  final int maxLines;

  const AutoSizeTextWidget(
    this.text, {
    required this.minFontSize,
    required this.maxFontSize,
    this.style,
    super.key,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = maxFontSize;
        final span = TextSpan(
          text: text,
          style: TextStyle(fontSize: fontSize),
        );
        final textPainter = TextPainter(
          text: span,
          maxLines: maxLines,
          textDirection: TextDirection.ltr,
        );

        textPainter.layout(maxWidth: constraints.maxWidth);
        while (textPainter.didExceedMaxLines ||
            textPainter.height > constraints.maxHeight) {
          fontSize -= 1;
          if (fontSize < minFontSize) {
            fontSize = minFontSize;
            break;
          }
          textPainter.text = TextSpan(
            text: text,
            style: TextStyle(fontSize: fontSize),
          );
          textPainter.layout(maxWidth: constraints.maxWidth);
        }

        return Text(
          text,
          style: style != null
              ? style!.copyWith(fontSize: fontSize)
              : TextStyle(fontSize: fontSize),
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
        );
      },
    );
  }
}
