import 'package:flame/components.dart';
import 'package:tic_tac_toe_flutter/enums/tile_border_enum.dart';
import 'package:tic_tac_toe_flutter/game/components/game_tile_component.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameGrid extends Component {
  final Vector2 screenSize;
  final GameState gameState;

  final tileWidth = 100.0;
  final tileHeight = 100.0;

  GameGrid({
    required this.screenSize,
    required this.gameState,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final rows = gameState.rows;
    final cols = gameState.cols;

    final gridWidth = tileWidth * cols;
    final gridHeight = tileHeight * rows;
    final screenCenter = Vector2(screenSize.x / 2, screenSize.y / 2);
    final gridStartPosition = Vector2(
      screenCenter.x - gridWidth / 2,
      100,
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

        add(GameTile(position, size, row, col, gameState, borders));
      }
    }
  }
}
