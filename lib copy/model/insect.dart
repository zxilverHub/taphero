import 'package:flame/components.dart';
import 'package:flame/events.dart';

class Insect extends SpriteAnimationComponent with HasGameRef, TapCallbacks {
  late double xPos;
  late double yPos;
  late int speed;
  bool isPopped = false; // Track if the insect is popped

  Insect({
    required this.xPos,
    required this.yPos,
    required this.speed,
  });

  @override
  Future<void> onLoad() async {
    size = Vector2(100, 100);
    anchor = Anchor.center;
    position = Vector2(xPos, yPos);
    priority = 10;

    final sprite1 = await Sprite.load('insects/ant_1 (1).png');
    final sprite2 = await Sprite.load('insects/ant_1 (2).png');

    animation = SpriteAnimation.spriteList(
      [sprite1, sprite2],
      stepTime: 0.2,
    );
  }

  @override
  void onTapDown(TapDownEvent event) async {
    if (!isPopped) {
      isPopped = true; // Prevent multiple taps

      // Load pop sprite
      final popSprite = await Sprite.load('effects/pop.png');

      SpriteComponent pop = SpriteComponent(
        sprite: popSprite,
        position: position,
        size: size,
        anchor: anchor,
        priority: 1,
      );

      // Ensure parent is not null before adding pop effect
      if (parent != null) {
        parent!.add(pop);
        Future.delayed(const Duration(milliseconds: 200), () {
          pop.removeFromParent(); // Remove safely
        });
      }

      // Remove original animated insect after popping
      removeFromParent();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (!isPopped) {
      y += speed * dt; // Move only if not popped
      if (y > gameRef.size.y / 1.3) {
        removeFromParent();
      }
    }
  }
}
