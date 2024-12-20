// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameState on _GameStateBase, Store {
  late final _$_playerOnTurnAtom =
      Atom(name: '_GameStateBase._playerOnTurn', context: context);

  @override
  Player? get _playerOnTurn {
    _$_playerOnTurnAtom.reportRead();
    return super._playerOnTurn;
  }

  @override
  set _playerOnTurn(Player? value) {
    _$_playerOnTurnAtom.reportWrite(value, super._playerOnTurn, () {
      super._playerOnTurn = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
