import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';

part 'game_state.g.dart';

@lazySingleton
@injectable
class GameState = _GameStateBase with _$GameState;

abstract class _GameStateBase with Store {
  // TODO: Lembrar de tentar implementar funcionalidade que alterna quem começa a rodada.

  final List<List<int?>> _gridContents = [];

  @observable
  Player? _player1;

  @observable
  Player? _player2;

  @observable
  Player? _playerOnTurn;

  int rows = 3;
  int cols = 3;

  _GameStateBase() {
    _initGridContent();
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

  void setGridContent(int col, int row, int? content) {
    _gridContents[row][col] = content;
  }

  int? getGridContent(int col, int row) {
    return _gridContents[row][col];
  }

  void addGridContentRow(List<int?> row) {
    _gridContents.add(row);
  }

  void playTurn(int col, int row) {
    if (canPlay(col, row)) {
      setGridContent(col, row, _playerOnTurn?.mark);

      if (_checkVictory()) {
        print('O vencedor é ${_playerOnTurn!.name}');
      } else {
        changeTurn();
      }
    }
  }

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

  bool _checkVictory() {
    List<int?> fieldValues = _gridContents.expand((row) => row).toList();

    return victoryConditions.any((condition) {
      var markedFields = condition.map((index) => fieldValues[index]).toList();

      return markedFields.every((value) => value == 0) ||
          markedFields.every((value) => value == 1);
    });
  }

  bool canPlay(int col, int row) => !gridHasContent(col, row);

  Player? get playerOnTurn => _playerOnTurn;

  Player? get player1 => _player1;

  Player? get player2 => _player2;

  List<List<int?>> get gridContents => _gridContents;

  void resetGame() {
    _initGridContent();
  }

  void _initGridContent() {
    _gridContents.clear();

    for (int row = 0; row < rows; row++) {
      _gridContents.add(List.filled(cols, null));
    }
  }
}
