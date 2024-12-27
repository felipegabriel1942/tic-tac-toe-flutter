import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameLogComponent extends TextBoxComponent {
  final bgPaint = Paint()..color = Colors.white;
  final borderPaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  final GameState gameState;

  final Vector2 componentSize;

  GameLogComponent({
    required this.gameState,
    required this.componentSize,
  }) : super(
          text: gameState.gameLog,
          position: Vector2(50, 600),
          textRenderer: TextPaint(
            style: GoogleFonts.pressStart2p(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          boxConfig: const TextBoxConfig(
            timePerChar: 0.02,
            margins: EdgeInsets.all(10),
          ),
          size: Vector2(componentSize.x, 100),
        );

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), bgPaint);
    canvas.drawRect(size.toRect(), borderPaint);
    super.render(canvas);
  }

  @override
  void update(double dt) {
    if (gameState.gameLog != text) {
      parent?.remove(this);
      parent?.add(GameLogComponent(
        gameState: gameState,
        componentSize: componentSize,
      ));
    }

    super.update(dt);
  }
}
