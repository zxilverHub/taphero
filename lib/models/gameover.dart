import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:learnflame/main.dart';

class GameOver extends PositionComponent with HasGameRef<MyGame> {
  late int level;
  GameOver(this.level);
  SpriteComponent over = SpriteComponent();
  PlayAgain playBtn = PlayAgain();
  TextLevel tl = TextLevel();
  BG bg = BG();

  @override
  Future<void> onLoad() async {
    size = gameRef.size;
    position = Vector2(0, 0);
    priority = 150;

    over
      ..sprite = await Sprite.load("effects/gameover.png")
      ..size = Vector2(size[0] - 50, 200)
      ..position = Vector2(size[0] / 2, size[1] / 2 - 100)
      ..anchor = Anchor.center
      ..priority = 10;

    tl
      ..position = Vector2(size[0] / 2, size[1] / 2 - 250)
      ..anchor = Anchor.center
      ..priority = 10
      ..text = "Score: ${level}";

    add(tl);
    add(over);
    add(playBtn);
    add(bg);
  }
}

class BG extends RectangleComponent with TapCallbacks, HasGameRef<MyGame> {
  @override
  Future<void> onLoad() async {
    paint = Paint()..color = Colors.black;
    size = gameRef.size;
    position = Vector2(0, 0);
    priority = 9;
  }

  @override
  void onTapDown(TapDownEvent event) {
    print('ok');
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
    gameRef.restartGame();
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
