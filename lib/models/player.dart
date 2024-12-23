import 'package:mobx/mobx.dart';

part 'player.g.dart';

class Player = _PlayerBase with _$Player;

abstract class _PlayerBase with Store {
  @observable
  String name;

  @observable
  int mark;

  @observable
  int score = 0;

  _PlayerBase({
    required this.name,
    required this.mark,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          mark == other.mark;

  @override
  int get hashCode => name.hashCode ^ mark.hashCode;

  @action
  void increaseScore() {
    score++;
  }
}
