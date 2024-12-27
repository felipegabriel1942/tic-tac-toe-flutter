import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/game/tic_tac_toe_game.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/widgets/draw_dialog.dart';
import 'package:tic_tac_toe_flutter/widgets/menu_button.dart';
import 'package:tic_tac_toe_flutter/widgets/victory_dialog.dart';

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
      body: Stack(
        children: [
          Positioned.fill(
            child: GameWidget(
              game: TicTacToeGame(
                gameState: gameState,
              ),
              overlayBuilderMap: {
                'Victory': (context, TicTacToeGame game) => VictoryDialog(
                      gameState: gameState,
                      onClose: () {
                        game.overlays.remove('Victory');
                        gameState.restartMatch();
                      },
                    ),
                'Draw': (context, TicTacToeGame game) => DrawDialog(
                      gameState: gameState,
                      onClose: () {
                        game.overlays.remove('Draw');
                        gameState.restartMatch();
                      },
                    ),
                'MenuButton': (context, TicTacToeGame game) => MenuButton()
              },
            ),
          )
        ],
      ),
    );
  }
}
