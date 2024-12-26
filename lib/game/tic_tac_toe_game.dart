import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/enums/match_status_enum.dart';
import 'package:tic_tac_toe_flutter/game/components/game_grid_component.dart';
import 'package:tic_tac_toe_flutter/game/components/game_log_component.dart';
import 'package:tic_tac_toe_flutter/game/components/game_score_component.dart';
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
      Player(name: 'Felipe', mark: 1),
      Player(name: 'Jordana', mark: 0),
    );

    var grid = GameGrid(
      screenSize: size,
      gameState: gameState,
    );

    var score = GameScoreComponent();

    var log = GameLogComponent(
      gameState: gameState,
      componentSize: Vector2(size.x - 100, size.y),
    );

    add(score);
    add(grid);
    add(log);
  }

  @override
  Color backgroundColor() {
    return const Color.fromARGB(0, 238, 234, 229);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameState.matchStatus != null &&
        gameState.matchStatus == MatchStatus.victory) {
      overlays.add('Victory');
    } else if (gameState.matchStatus != null &&
        gameState.matchStatus == MatchStatus.draw) {
      overlays.add('Draw');
    }
  }

  void close() {}
}
