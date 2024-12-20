import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/game/tic_tac_toe_game.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/widgets/game_log.dart';
import 'package:tic_tac_toe_flutter/widgets/game_score.dart';

class GameScreen extends StatelessWidget {
  final GameState gameState;

  const GameScreen({
    super.key,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context) {
    gameState.resetGame();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 300,
              child: GameWidget(
                game: TicTacToeGame(gameState: gameState),
              ),
            ),
            GameLog(gameState: gameState),
            GameScore(gameState: gameState)
          ],
        ),
      ),
    );
  }
}
