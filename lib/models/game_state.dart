import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe_flutter/enums/game_mode_enum.dart';
import 'package:tic_tac_toe_flutter/enums/match_status_enum.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';
import 'package:tic_tac_toe_flutter/models/victory_condition.dart';
import 'package:tic_tac_toe_flutter/services/grid_service.dart';
import 'package:tic_tac_toe_flutter/services/victory_service.dart';

part 'game_state.g.dart';

@lazySingleton
@injectable
class GameState = _GameStateBase with _$GameState;

abstract class _GameStateBase with Store {
  @observable
  Player? _player1;

  @observable
  Player? _player2;

  @observable
  Player? _playerOnTurn;

  @observable
  MatchStatus? _matchStatus;

  @observable
  GameMode? _gameMode = GameMode.twoPlayer;

  @observable
  String _gameLog = '';

  final VictoryService _victoryService;

  final GridService _gridService;

  VictoryCondition? winningCondition;

  _GameStateBase(this._victoryService, this._gridService);

  void changePlayerOnTurn() {
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
    _gameLog = 'Roboto: Você começa ${_playerOnTurn!.name}!';
  }

  int? getTileContent(int col, int row) {
    return _gridService.getTileContent(col, row);
  }

  void playTurn(int col, int row) {
    if (!_isValidMove(col, row)) return;

    _makeMove(col, row);

    if (_checkVictory()) {
      _handleVictory();
    } else if (_gridService.isFull()) {
      _handleDraw();
    } else {
      _nextPlayer();
    }
  }

  bool _isValidMove(col, row) {
    return canPlay(col, row) && winningCondition == null;
  }

  void _makeMove(int col, int row) {
    _gridService.setTileContent(col, row, _playerOnTurn?.mark);
  }

  bool _checkVictory() {
    VictoryCondition? victoryCondition =
        _victoryService.checkVictory(_gridService.gridContents);

    if (victoryCondition != null) {
      winningCondition = victoryCondition;
      return true;
    }

    return false;
  }

  void _handleVictory() {
    _playerOnTurn?.increaseScore();
    _gameLog = 'Roboto: ${_playerOnTurn!.name} venceu!';

    Future.delayed(const Duration(seconds: 2), () {
      _matchStatus = MatchStatus.victory;
      restartMatch();
    });
  }

  void _handleDraw() {
    _matchStatus = MatchStatus.draw;
  }

  void _nextPlayer() {
    changePlayerOnTurn();
    _gameLog = 'Roboto: Agora é sua vez ${_playerOnTurn!.name}!';
  }

  bool canPlay(int col, int row) => !_gridService.tileHasContent(col, row);

  void resetGame() {
    restartMatch();
    _player1?.resetScore();
    _player2?.resetScore();
  }

  void restartMatch() {
    _matchStatus = null;
    winningCondition = null;
    _gridService.resetGrid();
    changePlayerOnTurn();
    _gameLog = 'Roboto: Você começa ${_playerOnTurn?.name}!';
  }

  Player? get playerOnTurn => _playerOnTurn;

  Player? get player1 => _player1;

  Player? get player2 => _player2;

  int get rows => _gridService.rows;

  int get cols => _gridService.cols;

  bool get isFirstPlay => _gridService.gridContents
      .expand((row) => row)
      .toList()
      .every((element) => element == null);

  MatchStatus? get matchStatus => _matchStatus;

  String get gameLog => _gameLog;

  set gameMode(GameMode mode) {
    _gameMode = mode;
  }
}
