import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/game/tic_tac_toe_game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Screen'),
      ),
      body: Center(
        child: GameWidget(
          game: TicTacToeGame(),
        ),
      ),
    );
  }
}
