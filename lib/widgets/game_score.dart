import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';

class GameScore extends StatelessWidget {
  final GameState gameState;

  const GameScore({
    super.key,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 150,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Placar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Observer(builder: (_) => _buildPlayerRow(gameState.player1)),
          Observer(builder: (_) => _buildPlayerRow(gameState.player2)),
        ],
      ),
    );
  }

  Widget _buildPlayerRow(Player? player) {
    if (player == null) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            player.name,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        Flexible(
          child: Text(
            player.score.toString(),
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}