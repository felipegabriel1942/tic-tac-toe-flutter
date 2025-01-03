import 'package:flame/components.dart';
import 'package:tic_tac_toe_flutter/game/tic_tac_toe_game.dart';

class RobotoComponent extends SpriteComponent
    with HasGameReference<TicTacToeGame> {
  final Vector2 screenPosition;

  RobotoComponent({required this.screenPosition})
      : super(size: Vector2.all(164));

  @override
  void onLoad() {
    final robotoImage = game.images.fromCache('roboto2.png');

    sprite = Sprite(robotoImage);
    position = screenPosition;

    super.onLoad();
  }
}
