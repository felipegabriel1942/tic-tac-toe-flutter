import 'package:injectable/injectable.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';

@lazySingleton
@injectable
class GameState {
  final List<List<String?>> _gridContents = [];
  Player? _player1;
  Player? _player2;
  Player? _playerOnTurn;

  int rows = 3;
  int cols = 3;

  GameState() {
    for (int row = 0; row < rows; row++) {
      _gridContents.add(List.filled(cols, null));
    }
  }

  void changeTurn() {
    if (_playerOnTurn == _player1) {
      _playerOnTurn = _player2;
    } else {
      _playerOnTurn = _player1;
    }
  }

  void initializePlayers(Player player1, Player player2) {
    _player1 = player1;
    _player2 = player2;
    _playerOnTurn = player1;
  }

  bool gridHasContent(int col, int row) {
    return _gridContents[row][col] != null;
  }

  void setGridContent(int col, int row, String? content) {
    _gridContents[row][col] = content;
  }

  String? getGridContent(int col, int row) {
    return _gridContents[row][col];
  }

  void addGridContentRow(List<String?> row) {
    _gridContents.add(row);
  }

  void playTurn(int col, int row) {
    if (canPlay(col, row)) {
      setGridContent(col, row, _playerOnTurn?.mark);
      changeTurn();
    }
  }

  bool canPlay(int col, int row) => !gridHasContent(col, row);

  Player? get playerOnTurn => _playerOnTurn;
}
