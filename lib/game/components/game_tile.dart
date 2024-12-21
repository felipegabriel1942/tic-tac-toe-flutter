import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_flutter/injectable.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameTile extends PositionComponent with TapCallbacks {
  final GameState gameState;
  final int row;
  final int col;

  GameTile(Vector2 position, Vector2 size, this.row, this.col, this.gameState)
      : super(
          position: position,
          size: size,
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final backgroundPaint = Paint()..color = Colors.white;

    final backgroundRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.x, size.y),
      const Radius.circular(7.0),
    );

    canvas.drawRRect(backgroundRect, backgroundPaint);

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRRect(backgroundRect, borderPaint);

    var gridContent = gameState.getGridContent(col, row);

    if (gridContent != null) {
      var gridText = gridContent == 1 ? 'X' : 'O';

      final textSpan = TextSpan(
        text: gridText,
        style: GoogleFonts.pressStart2p(
          textStyle: TextStyle(
            color: _getContentColor(gridText),
            fontSize: 30,
          ),
        ),
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();

      final xOffset = (size.x - textPainter.width) / 2;
      final yOffset = (size.y - textPainter.height) / 2;

      textPainter.paint(canvas, Offset(xOffset, yOffset));
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    getIt<GameState>().playTurn(col, row);
  }

  Color? _getContentColor(String? content) {
    if (content == null) {
      return Colors.black;
    }

    if (content == "X") {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}
