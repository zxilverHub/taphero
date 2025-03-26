import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Energy extends PositionComponent {
  late int energy;

  Energy(this.energy);

  SpriteComponent energyBg = SpriteComponent();
  EnergyText energyText = EnergyText();

  @override
  Future<void> onLoad() async {
    size = Vector2(60, 70);
    position = Vector2(80, 10);
    priority = 115;

    energyBg
      ..sprite = await Sprite.load("backgrounds/energybg.png")
      ..size = Vector2(60, 70)
      ..position = Vector2(size[0] / 2 + 5, size[1] / 2)
      ..priority = 9
      ..anchor = Anchor.center;

    energyText
      ..text = energy.toString()
      ..position = Vector2(size[0] / 2, size[1] / 2)
      ..anchor = Anchor.center
      ..priority = 10;

    add(energyText);
    add(energyBg);
  }

  void updateEnergy(int e) {
    energy = e;
    energyText.text = energy.toString();
  }
}

class EnergyText extends TextComponent {
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
