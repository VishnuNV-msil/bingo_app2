import 'package:flutter/material.dart';


class GridLines extends CustomPainter {
  final Paint _paint;
  final List bingoList;
  GridLines(this._paint, this.bingoList);

  @override
  void paint(Canvas canvas, Size size) {
    double cellWidth = size.width / 5;
    double cellHeight = size.height / 5;
    double lineLength = size.width * 5;
    double offsetX;
    double offsetY;

    if (bingoList.contains('c1')) {
      offsetX = cellWidth / 2;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c2')) {
      offsetX = cellWidth * 1.5;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c3')) {
      offsetX = cellWidth * 2.5;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c4')) {
      offsetX = cellWidth * 3.5;
      drawLineVerticalLine(canvas, offsetX);
    }
    if (bingoList.contains('c5')) {
      offsetX = cellWidth * 4.5;
      drawLineVerticalLine(canvas, offsetX);
    }

    if (bingoList.contains('r1')) {
      offsetY = cellHeight / 2;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r2')) {
      offsetY = cellHeight * 1.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r3')) {
      offsetY = cellHeight * 2.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r4')) {
      offsetY = cellHeight * 3.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('r5')) {
      offsetY = cellHeight * 4.5;
      drawHorizontalLine(canvas, offsetY);
    }
    if (bingoList.contains('dRight')) {
      canvas.drawLine(
        const Offset(0, 0),
        Offset(lineLength/5, lineLength/5),
        _paint,
      );
    }
    if (bingoList.contains('dLeft')) {
      canvas.drawLine(
        Offset(0, lineLength/5),
        Offset(lineLength/5, 0),
        _paint,
      );
    }
  }

  void drawLineVerticalLine(Canvas canvas, double offsetX) {
    double lineLength = 350.0;
    canvas.drawLine(
      Offset(offsetX, 0),
      Offset(offsetX, lineLength + 8),
      _paint,
    );
  }

  void drawHorizontalLine(Canvas canvas, double offsetY) {
    double lineLength = 350.0;
    canvas.drawLine(
      Offset(0, offsetY),
      Offset(lineLength + 8, offsetY),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
