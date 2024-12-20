import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/game/components/game_grid.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';

class TicTacToeGame extends FlameGame with HasKeyboardHandlerComponents {
  final GameState gameState;

  TicTacToeGame({
    super.children,
    super.world,
    super.camera,
    required this.gameState,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();
    initializeGame();
  }

  void initializeGame() {
    gameState.initializePlayers(
      Player(name: 'Felipe', mark: 'X'),
      Player(name: 'Jordana', mark: 'O'),
    );

    var grid = GameGrid(screenSize: size, gameState: gameState);

    add(grid);
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(0, 238, 234, 229);
  }
}
