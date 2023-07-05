import 'package:flutter/material.dart';

class AsciiArt extends StatelessWidget {
  final String ascii;
  final Color fgColor;
  final Color? bgColor;

  AsciiArt(this.ascii, this.fgColor, {this.bgColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      child: LayoutBuilder(
          builder: (BuildContext ctx, BoxConstraints constraints) {
        // calculate size
        var size = _calcTextSize(ascii);
        var width = constraints.maxWidth;
        var height = width / size.width * size.height;

        return SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            painter: AsciiArtPainter(ascii, fgColor),
          ),
        );
      }),
    );
  }
}

class AsciiArtPainter extends CustomPainter {
  final String asciiText;
  final Color fgColor;

  AsciiArtPainter(this.asciiText, this.fgColor);

  @override
  void paint(Canvas canvas, Size size) {
    List<String> lines = asciiText.split('\n');
    var maxLen = 0;
    for (var line in lines) {
      if (line.length > maxLen) {
        maxLen = line.length;
      }
    }

    double fontSize = size.width / (maxLen - 1);
    final textStyle = TextStyle(
      color: fgColor,
      fontSize: fontSize,
    );

    lines.asMap().forEach((idx, line) {
      for (int i = 0; i < line.length; ++i) {
        final TextPainter textPainter = TextPainter(
          text: TextSpan(text: line[i], style: textStyle),
          textDirection: TextDirection.ltr,
          textScaleFactor: 1,
        )..layout();
        final x = fontSize * i;
        final y = fontSize * idx;
        textPainter.paint(canvas, Offset(x, y));
      }
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

Size _calcTextSize(String text) {
  List<String> lines = text.split('\n');
  var width = 0;
  for (var line in lines) {
    if (line.length > width) {
      width = line.length;
    }
  }
  var height = lines.length;
  return Size(width.toDouble(), height.toDouble());
}
