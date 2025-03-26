import 'package:flame/components.dart';
import 'package:learnflame/main.dart';
import 'package:learnflame/models/kalabanList.dart';

class CharacterCard extends SpriteComponent with HasGameRef<MyGame> {
  late int charIndex;
  CharacterCard(this.charIndex);

  @override
  Future<void> onLoad() async {
    sprite =
        await Sprite.load("profiles/${KALABAN[charIndex]["name"]} profile.png");
    size = Vector2(gameRef.size[0] - 20, (gameRef.size[0] - 20) * 1.5);
    position = Vector2(gameRef.size[0] / 2, gameRef.size[1] / 2);
    anchor = Anchor.center;
    priority = 10;
  }
}
