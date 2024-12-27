import 'package:tic_tac_toe_flutter/enums/victory_line_enum.dart';

class VictoryCondition {
  List<List<int>> positions;

  VictoryLine line;

  VictoryCondition({
    required this.positions,
    required this.line,
  });
}
