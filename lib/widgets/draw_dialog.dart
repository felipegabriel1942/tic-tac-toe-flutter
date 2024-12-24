import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class DrawDialog extends StatelessWidget {
  final GameState gameState;
  final VoidCallback onClose;

  const DrawDialog({
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
            title: const Text(
              'Fim da partida!',
              style: TextStyle(fontSize: 18),
            ),
            content: const Text(
              'Empate, ninguém venceu!',
              style: TextStyle(fontSize: 13),
            ),
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
