import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:learnflame/main.dart';

class Level extends PositionComponent with HasGameRef<MyGame> {
  int level = 1;

  SpriteComponent levelBg = SpriteComponent();
  TextLevel levelLabel = TextLevel();
  @override
  Future<void> onLoad() async {
    size = Vector2(60, 70);
    position = Vector2(10, 10);
    priority = 115;

    levelBg
      ..sprite = await Sprite.load("backgrounds/levelbg.png")
      ..size = Vector2(60, 70);

    levelLabel
      ..text = level.toString()
      ..position = Vector2(size[0] / 2, size[1] / 2)
      ..anchor = Anchor.center;

    add(levelBg);
    add(levelLabel);
  }

  void updateLevel({int? l}) {
    if (l == null) {
      level++;
    } else {
      level = l;
    }
    levelLabel.text = level.toString();
  }
}

class TextLevel extends TextComponent {
  @override
  Future<void> onLoad() async {
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
