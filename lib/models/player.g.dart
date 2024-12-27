// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Player on _PlayerBase, Store {
  late final _$nameAtom = Atom(name: '_PlayerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$markAtom = Atom(name: '_PlayerBase.mark', context: context);

  @override
  int get mark {
    _$markAtom.reportRead();
    return super.mark;
  }

  @override
  set mark(int value) {
    _$markAtom.reportWrite(value, super.mark, () {
      super.mark = value;
    });
  }

  late final _$scoreAtom = Atom(name: '_PlayerBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$_PlayerBaseActionController =
      ActionController(name: '_PlayerBase', context: context);

  @override
  void increaseScore() {
    final _$actionInfo = _$_PlayerBaseActionController.startAction(
        name: '_PlayerBase.increaseScore');
    try {
      return super.increaseScore();
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetScore() {
    final _$actionInfo = _$_PlayerBaseActionController.startAction(
        name: '_PlayerBase.resetScore');
    try {
      return super.resetScore();
    } finally {
      _$_PlayerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
mark: ${mark},
score: ${score}
    ''';
  }
}
