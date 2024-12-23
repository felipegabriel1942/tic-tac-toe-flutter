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
            borderRadius: BorderRadius.circular(6),
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          // TODO: Criar um serviço para gerenciar os logs
          child: gameState.playerOnTurn == null
              ? const SizedBox.shrink()
              : gameState.isFirstPlay
                  ? Center(
                      child: Text(
                        'Você começa ${gameState.playerOnTurn!.name}!',
                        style: const TextStyle(fontSize: 12),
                      ),
                    )
                  : Center(
                      child: Text(
                        'É sua vez ${gameState.playerOnTurn!.name}!',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
        );
      },
    );
  }
}
