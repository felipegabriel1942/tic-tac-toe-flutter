import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_tac_toe_flutter/injectable.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameLog extends StatelessWidget {
  const GameLog({super.key});

  @override
  Widget build(BuildContext context) {
    final gameState = getIt<GameState>();

    return Observer(
      builder: (_) {
        return Container(
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2.5),
          ),
          child: gameState.playerOnTurn == null
              ? const Text('')
              : Text(
                  'Agora é a vez do ${gameState.playerOnTurn!.name}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        );
      },
    );
  }
}
