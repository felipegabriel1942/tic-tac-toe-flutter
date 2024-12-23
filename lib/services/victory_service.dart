import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class VictoryService {
  List<List<int>> victoryConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  bool checkVictory(List<List<int?>> gridContents) {
    List<int?> fieldValues = gridContents.expand((row) => row).toList();

    return victoryConditions.any((condition) {
      var markedFields = condition.map((index) => fieldValues[index]).toList();

      return markedFields.every((value) => value == 0) ||
          markedFields.every((value) => value == 1);
    });
  }
}
