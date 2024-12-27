import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_flutter/game/tic_tac_toe_game.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameScoreComponent extends PositionComponent
    with HasGameReference<TicTacToeGame> {
  final borderPaint = Paint()
    ..color = Colors.black
    ..style = PaintingStyle.stroke
    ..strokeWidth = 3;

  late final TextComponent textComponent;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    textComponent = TextComponent(
      text: _getScoreText(game.gameState),
      textRenderer: TextPaint(
        style: GoogleFonts.pressStart2p(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
      anchor: Anchor.center,
      position: Vector2(100, 160),
    );

    add(textComponent);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), borderPaint);
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    textComponent.text = _getScoreText(game.gameState);
  }

  static String _getScoreText(GameState gameState) {
    final player1 = gameState.player1;
    final player2 = gameState.player2;

    return '''
      ${player1?.name ?? 'Jogador 1'}: ${player1?.score ?? 0}
      
      ${player2?.name ?? 'Jogador 2'}: ${player2?.score ?? 0}
    ''';
  }
}
