import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:learnflame/main.dart';

class Book extends SpriteComponent with TapCallbacks, HasGameRef<MyGame> {
  double w = 60;
  double h = 50;

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load("backgrounds/book.png");
    size = Vector2(w, h);
    position = Vector2(gameRef.size[0] - (10 + w), 20);
    priority = 115;
  }

  @override
  void onTapDown(TapDownEvent event) {
    gameRef.showCard();
  }
}
