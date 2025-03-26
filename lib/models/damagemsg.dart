import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DamageMsg extends TextComponent {
  late Vector2 pos;
  late double dmg;
  DamageMsg(
    this.pos,
    this.dmg,
  );

  double txtSize = 14;

  @override
  Future<void> onLoad() async {
    text = dmg.toString();
    position = pos;
    priority = 97;

    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: txtSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void update(double dt) async {
    super.update(dt);

    y -= 2;
    x += 2;
    txtSize += 0.5;
    textRenderer = TextPaint(
      style: TextStyle(
        fontSize: txtSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
