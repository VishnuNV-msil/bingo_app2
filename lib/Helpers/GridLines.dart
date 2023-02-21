import 'package:flutter/material.dart';
import '../Strings/strings.dart';


class GridLines extends CustomPainter {
  final Paint _paint;
  final List bingoList;
  GridLines(this._paint, this.bingoList);

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / 5;
    double cellHeight = size.height / 5;
    double lineLength = size.width;
    double offsetX;
    double offsetY;

    if (bingoList.contains(Strings.c1Str)) {
      offsetX = cellWidth / 2;
      drawLineVerticalLine(canvas, offsetX, lineLength);
    }
    if (bingoList.contains(Strings.c2Str)) {
      offsetX = cellWidth * 1.5;
      drawLineVerticalLine(canvas, offsetX, lineLength);
    }
    if (bingoList.contains(Strings.c3Str)) {
      offsetX = cellWidth * 2.5;
      drawLineVerticalLine(canvas, offsetX, lineLength);
    }
    if (bingoList.contains(Strings.c4Str)) {
      offsetX = cellWidth * 3.5;
      drawLineVerticalLine(canvas, offsetX, lineLength);
    }
    if (bingoList.contains(Strings.c5Str)) {
      offsetX = cellWidth * 4.5;
      drawLineVerticalLine(canvas, offsetX, lineLength);
    }

    if (bingoList.contains(Strings.r1Str)) {
      offsetY = cellHeight / 2;
      drawHorizontalLine(canvas, offsetY, lineLength);
    }
    if (bingoList.contains(Strings.r2Str)) {
      offsetY = cellHeight * 1.5;
      drawHorizontalLine(canvas, offsetY, lineLength);
    }
    if (bingoList.contains(Strings.r3Str)) {
      offsetY = cellHeight * 2.5;
      drawHorizontalLine(canvas, offsetY, lineLength);
    }
    if (bingoList.contains(Strings.r4Str)) {
      offsetY = cellHeight * 3.5;
      drawHorizontalLine(canvas, offsetY, lineLength);
    }
    if (bingoList.contains(Strings.r5Str)) {
      offsetY = cellHeight * 4.5;
      drawHorizontalLine(canvas, offsetY, lineLength);
    }
    if (bingoList.contains(Strings.dRightStr)) {
      canvas.drawLine(
        const Offset(0, 0),
        Offset(lineLength, lineLength),
        _paint,
      );
    }
    if (bingoList.contains(Strings.dLeftStr)) {
      canvas.drawLine(
        Offset(0, lineLength),
        Offset(lineLength, 0),
        _paint,
      );
    }
  }

  void drawLineVerticalLine(Canvas canvas, double offsetX, double lineLength) {
    canvas.drawLine(
      Offset(offsetX, 0),
      Offset(offsetX, lineLength),
      _paint,
    );
  }

  void drawHorizontalLine(Canvas canvas, double offsetY, double lineLength) {
    canvas.drawLine(
      Offset(0, offsetY),
      Offset(lineLength , offsetY),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
