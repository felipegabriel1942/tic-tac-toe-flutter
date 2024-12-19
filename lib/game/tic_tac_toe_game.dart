import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/game/components/game_grid.dart';
import 'package:tic_tac_toe_flutter/injectable.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';

class TicTacToeGame extends FlameGame with HasKeyboardHandlerComponents {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    initializeGame();
  }

  void initializeGame() {
    final gameState = getIt<GameState>();

    gameState.initializePlayers(
      Player(name: 'Jogador 1', mark: 'X'),
      Player(name: 'Jogador 2', mark: 'O'),
    );

    var grid = GameGrid(screenSize: size);

    add(grid);
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(0, 238, 234, 229);
  }
}
