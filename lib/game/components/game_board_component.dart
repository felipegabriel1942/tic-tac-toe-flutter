import 'package:flame/components.dart';
import 'package:tic_tac_toe_flutter/enums/tile_border_enum.dart';
import 'package:tic_tac_toe_flutter/enums/victory_line_enum.dart';
import 'package:tic_tac_toe_flutter/game/components/game_tile_component.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameBoard extends Component {
  final Vector2 screenSize;
  final GameState gameState;
  final double tileWidth = 100.0;
  final double tileHeight = 100.0;

  List<List<GameTile>> tiles = [];

  GameBoard({
    required this.screenSize,
    required this.gameState,
  }) {
    tiles = List.generate(
        3,
        (row) => List.generate(
            3,
            (col) => GameTile(
                Vector2.zero(), Vector2.zero(), row, col, gameState, {})));
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final rows = gameState.rows;
    final cols = gameState.cols;

    final gridWidth = tileWidth * cols;
    // final gridHeight = tileHeight * rows;
    final screenCenter = Vector2(screenSize.x / 2, screenSize.y / 2);
    final gridStartPosition = Vector2(
      screenCenter.x - gridWidth / 2,
      250,
    );

    final Map<int, Map<int, Set<TileBorder>>> borderMap = {
      0: {
        0: {TileBorder.bottom, TileBorder.right},
        1: {TileBorder.bottom},
        2: {TileBorder.bottom, TileBorder.left}
      },
      1: {
        0: {TileBorder.bottom, TileBorder.right},
        1: {TileBorder.bottom},
        2: {TileBorder.bottom, TileBorder.left}
      },
      2: {
        0: {TileBorder.right},
        1: {},
        2: {TileBorder.left}
      }
    };

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        var position =
            gridStartPosition + Vector2(col * tileWidth, row * tileHeight);
        var size = Vector2(tileWidth, tileHeight);
        final borders = borderMap[row]?[col] ?? {};

        var tile = GameTile(position, size, row, col, gameState, borders);

        tiles[row][col] = tile;

        add(tile);
      }
    }
  }

  void updateTile(int row, int col, VictoryLine victoryLine) {
    var tile = tiles[row][col];

    tile.victoryLine = victoryLine;
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (gameState.winningCondition != null) {
      for (var position in gameState.winningCondition!.positions) {
        updateTile(position[0], position[1], gameState.winningCondition!.line);
      }
    } else {
      for (var row in tiles) {
        for (var tile in row) {
          tile.victoryLine = null;
        }
      }
    }
  }
}
