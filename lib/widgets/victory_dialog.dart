import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class VictoryDialog extends StatelessWidget {
  final GameState gameState;
  final VoidCallback onClose;

  const VictoryDialog({
    super.key,
    required this.gameState,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Center(
          child: AlertDialog(
            title: const Text('Fim da partida!'),
            content: Text('${gameState.playerOnTurn?.name} venceu!'),
            actions: [
              TextButton(
                onPressed: onClose,
                child: const Text('Jogar novamente?'),
              )
            ],
          ),
        )
      ],
    );
  }
}
