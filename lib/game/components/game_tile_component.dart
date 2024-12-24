import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_flutter/enums/tile_border_enum.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameTile extends PositionComponent with TapCallbacks {
  final GameState gameState;
  final int row;
  final int col;
  final Set<TileBorder> borders;

  GameTile(
    Vector2 position,
    Vector2 size,
    this.row,
    this.col,
    this.gameState,
    this.borders,
  ) : super(
          position: position,
          size: size,
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    if (borders.contains(TileBorder.top)) {
      canvas.drawLine(const Offset(0, 0), Offset(size.x, 0), borderPaint);
    }

    if (borders.contains(TileBorder.bottom)) {
      canvas.drawLine(Offset(0, size.y), Offset(size.x, size.y), borderPaint);
    }

    if (borders.contains(TileBorder.left)) {
      canvas.drawLine(const Offset(0, 0), Offset(0, size.y), borderPaint);
    }

    if (borders.contains(TileBorder.right)) {
      canvas.drawLine(Offset(size.x, 0), Offset(size.x, size.y), borderPaint);
    }

    var tileContent = gameState.getTileContent(col, row);

    if (tileContent != null) {
      var gridText = tileContent == 1 ? 'X' : 'O';

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
    gameState.playTurn(col, row);
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
