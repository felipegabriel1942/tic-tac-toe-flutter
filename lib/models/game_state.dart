import 'package:tic_tac_toe_flutter/models/player.dart';

class GameState {
  final List<List<String?>> _gridContents = [];

  Player? _player1;
  Player? _player2;
  Player? _playerOnTurn;

  static final GameState _instance = GameState._();

  GameState._();

  static GameState get instance {
    return _instance;
  }

  void changeTurn() {
    if (_playerOnTurn == _player1) {
      _playerOnTurn = _player2;
    } else {
      _playerOnTurn = _player1;
    }
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

  Player? getPlayer1() {
    return _player1;
  }

  Player? getPlayer2() {
    return _player2;
  }

  set player1(Player player) {
    _player1 = player;
  }

  set player2(Player player) {
    _player2 = player;
  }

  set playerOnTurn(Player player) {
    _playerOnTurn = player;
  }

  Player? getPlayerOnTurn() {
    return _playerOnTurn;
  }
}
