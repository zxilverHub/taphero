import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LifeBar extends RectangleComponent with HasGameRef {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(0, 5);
    priority = 115;
    paint = Paint()..color = Colors.amber;
  }

  @override
  void update(double dt) async {
    super.update(dt);

    if (size[0] > 0) {
      size = Vector2(size[0] - dt * 10, 5);
    }
  }
}
