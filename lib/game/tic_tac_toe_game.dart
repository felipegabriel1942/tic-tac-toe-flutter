import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/game/components/game_grid.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';

class TicTacToeGame extends FlameGame with HasKeyboardHandlerComponents {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    initializeGame();
  }

  void initializeGame() {
    final gameState = GameState.instance;

    gameState.player1 = Player(name: 'Jogador 1', mark: 'X');
    gameState.player2 = Player(name: 'Jogador 2', mark: 'O');
    gameState.playerOnTurn = gameState.getPlayer1()!;

    var grid = GameGrid(cols: 3, rows: 3, screenSize: size);
    add(grid);
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(0, 238, 234, 229);
  }
}
