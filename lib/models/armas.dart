import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:learnflame/main.dart';

List<String> ARMAS = [
  "Tsinelas",
  "Tubig",
  "Apoy",
  "Espada",
];

/*
  0 tsinelas
  1 tubig
  2 apoy
  3 espada
*/

class Armas extends PositionComponent with TapCallbacks, HasGameRef<MyGame> {
  late String weapon;
  late int posX;

  Armas(
    this.weapon,
    this.posX,
  );

  SpriteComponent armasImg = SpriteComponent();

  @override
  Future<void> onLoad() async {
    size = Vector2(40, 60);

    position = Vector2(posX * 50.0 + (10 * posX), 30);

    armasImg
      ..sprite = await Sprite.load("armas/$weapon")
      ..size = size;

    add(armasImg);
  }

  @override
  void onTapDown(TapDownEvent event) {
    gameRef.setWeapon(posX);
  }
}
