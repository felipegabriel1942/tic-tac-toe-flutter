import 'package:flame/components.dart';
import 'package:tic_tac_toe_flutter/game/components/game_tile.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';

class GameGrid extends Component {
  final int rows;
  final int cols;
  final Vector2 screenSize;

  final tileWidth = 150.0;
  final tileHeight = 150.0;

  GameGrid({
    required this.rows,
    required this.cols,
    required this.screenSize,
  });

  @override
  Future<void> onLoad() async {
    super.onLoad();

    final gridWidth = tileWidth * cols;
    final gridHeight = tileHeight * rows;
    final screenCenter = Vector2(screenSize.x / 2, screenSize.y / 2);
    final gridStartPosition = Vector2(
        screenCenter.x - gridWidth / 2, screenCenter.y - gridHeight / 2);

    final gameState = GameState.instance;

    for (int row = 0; row < rows; row++) {
      List<String?> rowContent = [];

      for (int col = 0; col < cols; col++) {
        var position =
            gridStartPosition + Vector2(col * tileWidth, row * tileHeight);
        var size = Vector2(tileWidth, tileHeight);
        var tile = GameTile(position, size, row, col);

        rowContent.add(null);

        add(tile);
      }

      gameState.addGridContentRow(rowContent);
    }
  }
}
