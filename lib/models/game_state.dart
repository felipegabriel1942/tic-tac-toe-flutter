import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';
import 'package:tic_tac_toe_flutter/services/grid_service.dart';
import 'package:tic_tac_toe_flutter/services/victory_service.dart';

part 'game_state.g.dart';

@lazySingleton
@injectable
class GameState = _GameStateBase with _$GameState;

abstract class _GameStateBase with Store {
  // TODO: Lembrar de tentar implementar funcionalidade que alterna quem começa a rodada.

  @observable
  Player? _player1;

  @observable
  Player? _player2;

  @observable
  Player? _playerOnTurn;

  final VictoryService _victoryService;

  final GridService _gridService;

  _GameStateBase(this._victoryService, this._gridService);

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

  int? getGridContent(int col, int row) {
    return _gridService.getGridContent(col, row);
  }

  void playTurn(int col, int row) {
    if (canPlay(col, row)) {
      _gridService.setGridContent(col, row, _playerOnTurn?.mark);

      if (_victoryService.checkVictory(_gridService.gridContents)) {
        print('O vencedor é ${_playerOnTurn!.name}');
        resetGame();
      } else {
        changeTurn();
      }
    }
  }

  bool canPlay(int col, int row) => !_gridService.gridHasContent(col, row);

  Player? get playerOnTurn => _playerOnTurn;

  Player? get player1 => _player1;

  Player? get player2 => _player2;

  int get rows => _gridService.rows;

  int get cols => _gridService.cols;

  void resetGame() {
    _gridService.resetGrid();
  }
}
