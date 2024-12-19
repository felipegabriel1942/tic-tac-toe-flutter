import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/injectable.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameTile extends PositionComponent with TapCallbacks {
  final int row;
  final int col;

  GameTile(Vector2 position, Vector2 size, this.row, this.col)
      : super(
          position: position,
          size: size,
        );

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    var gameState = getIt<GameState>();

    final borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), borderPaint);

    var gridContent = gameState.getGridContent(col, row);

    final textSpan = TextSpan(
        text: gridContent,
        style: const TextStyle(color: Colors.black, fontSize: 48));

    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    final xOffset = (size.x - textPainter.width) / 2;
    final yOffset = (size.y - textPainter.height) / 2;

    textPainter.paint(canvas, Offset(xOffset, yOffset));
  }

  @override
  void onTapUp(TapUpEvent event) {
    getIt<GameState>().playTurn(col, row);
  }
}
