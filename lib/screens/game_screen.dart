import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/game/tic_tac_toe_game.dart';
import 'package:tic_tac_toe_flutter/injectable.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/widgets/game_log.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = getIt<GameState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: GameWidget(
                game: TicTacToeGame(),
              ),
            ),
            const GameLog()
          ],
        ),
      ),
    );
  }
}
