import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_flutter/enums/match_status_enum.dart';
import 'package:tic_tac_toe_flutter/game/components/game_board_component.dart';
import 'package:tic_tac_toe_flutter/game/components/game_log_component.dart';
import 'package:tic_tac_toe_flutter/game/components/game_score_component.dart';
import 'package:tic_tac_toe_flutter/game/components/roboto_component.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';

class TicTacToeGame extends FlameGame with HasKeyboardHandlerComponents {
  final GameState gameState;

  TicTacToeGame({
    required this.gameState,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();

    await images.loadAll([
      'roboto.png',
      'roboto2.png',
      'roboto-idle.png',
    ]);

    initializeGame();
  }

  void initializeGame() {
    overlays.add('MenuButton');

    gameState.initializePlayers(
      Player(name: 'Felipe', mark: 1),
      Player(name: 'Jordana', mark: 0),
    );

    var grid = GameBoard(
      screenSize: size,
      gameState: gameState,
    );

    var score = GameScoreComponent();

    var log = GameLogComponent(
      gameState: gameState,
      componentSize: Vector2(size.x - 100, size.y),
    );

    var roboto = RobotoComponent(screenPosition: Vector2(130, 710));

    addAll([score, grid, log, roboto]);
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
}
