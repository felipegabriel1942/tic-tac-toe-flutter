import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameLog extends StatelessWidget {
  final GameState gameState;

  const GameLog({
    super.key,
    required this.gameState,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          width: 300,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: gameState.playerOnTurn == null
              ? const Text('')
              : Center(
                  child: Text(
                    'Agora é sua vez ${gameState.playerOnTurn!.name}...',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
