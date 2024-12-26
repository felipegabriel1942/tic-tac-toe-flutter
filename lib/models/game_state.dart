import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:tic_tac_toe_flutter/enums/game_mode_enum.dart';
import 'package:tic_tac_toe_flutter/enums/match_status_enum.dart';
import 'package:tic_tac_toe_flutter/models/player.dart';
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
    if (canPlay(col, row)) {
      _gridService.setTileContent(col, row, _playerOnTurn?.mark);

      if (_victoryService.checkVictory(_gridService.gridContents)) {
        _playerOnTurn?.increaseScore();
        _gridService.resetGrid();
        _matchStatus = MatchStatus.victory;
      } else if (_gridService.isFull()) {
        _matchStatus = MatchStatus.draw;
      } else {
        changePlayerOnTurn();
        _gameLog = 'Roboto: Agora é sua vez ${_playerOnTurn!.name}!';
      }
    }
  }

  bool canPlay(int col, int row) => !_gridService.tileHasContent(col, row);

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

  void resetGame() {
    _matchStatus = null;
    changePlayerOnTurn();
    _gridService.resetGrid();
  }

  set gameMode(GameMode mode) {
    _gameMode = mode;
  }
}
