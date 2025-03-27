import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:learnflame/main.dart';

class StartScreen extends PositionComponent with HasGameRef<MyGame> {
  SpriteComponent taphero = SpriteComponent();
  PlayAgain playG = PlayAgain();
  @override
  Future<void> onLoad() async {
    size = gameRef.size;
    priority = 200;

    taphero
      ..sprite = await Sprite.load('backgrounds/taphero.jpg')
      ..size = gameRef.size
      ..position = Vector2(0, 0)
      ..priority = 10;

    add(taphero);
    add(playG);
  }
}

class PlayAgain extends SpriteComponent with TapCallbacks, HasGameRef<MyGame> {
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load("effects/play.png");
    size = Vector2(150, 80);
    position = Vector2(gameRef.size[0] / 2, gameRef.size[1] - 200);
    anchor = Anchor.center;
    priority = 11;
  }

  @override
  void onTapDown(TapDownEvent event) async {
    gameRef.startGame();
  }
}
