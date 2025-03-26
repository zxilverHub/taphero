import 'package:flame/components.dart';

class Attack extends SpriteAnimationComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    //
    size = Vector2(100, 60);
    priority = 96;
    anchor = Anchor.topCenter;

    final sprite1 = await Sprite.load("effects/armas1.png");
    final sprite2 = await Sprite.load("effects/armas1 1.png");
    final sprite3 = await Sprite.load("effects/armas1 2.png");

    animation = SpriteAnimation.spriteList(
      [sprite2],
      stepTime: 0.1,
      loop: false,
    );
  }
}
