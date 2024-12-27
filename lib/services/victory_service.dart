import 'package:injectable/injectable.dart';
import 'package:tic_tac_toe_flutter/enums/victory_line_enum.dart';
import 'package:tic_tac_toe_flutter/models/victory_condition.dart';

@injectable
@lazySingleton
class VictoryService {
  List<VictoryCondition> conditions = [
    VictoryCondition(
      positions: [
        [0, 0],
        [0, 1],
        [0, 2]
      ],
      line: VictoryLine.horizontal,
    ),
    VictoryCondition(
      positions: [
        [1, 0],
        [1, 1],
        [1, 2]
      ],
      line: VictoryLine.horizontal,
    ),
    VictoryCondition(
      positions: [
        [2, 0],
        [2, 1],
        [2, 2]
      ],
      line: VictoryLine.horizontal,
    ),
    VictoryCondition(
      positions: [
        [0, 0],
        [1, 0],
        [2, 0]
      ],
      line: VictoryLine.vertical,
    ),
    VictoryCondition(
      positions: [
        [0, 1],
        [1, 1],
        [2, 1]
      ],
      line: VictoryLine.vertical,
    ),
    VictoryCondition(
      positions: [
        [0, 2],
        [1, 2],
        [2, 2]
      ],
      line: VictoryLine.vertical,
    ),
    VictoryCondition(
      positions: [
        [0, 0],
        [1, 1],
        [2, 2]
      ],
      line: VictoryLine.diagonalRight,
    ),
    VictoryCondition(
      positions: [
        [0, 2],
        [1, 1],
        [2, 0]
      ],
      line: VictoryLine.diagonalLeft,
    )
  ];

  VictoryCondition? checkVictory(List<List<int?>> gridContents) {
    for (var condition in conditions) {
      int? firstTile =
          gridContents[condition.positions[0][0]][condition.positions[0][1]];

      if (firstTile != null &&
          condition.positions
              .every((pos) => gridContents[pos[0]][pos[1]] == firstTile)) {
        return condition;
      }
    }

    return null;
  }
}
