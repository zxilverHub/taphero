import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:learnflame/main.dart';
import 'package:learnflame/models/attack.dart';
import 'package:learnflame/models/damagemsg.dart';

class ScreenTap extends RectangleComponent
    with TapCallbacks, HasGameRef<MyGame> {
  @override
  Future<void> onLoad() async {
    priority = 100;
    size = Vector2(gameRef.size[0], gameRef.size[1]);
    paint = Paint()..color = Colors.transparent;
  }

  // @override
  // void onTapDown(TapDownEvent event) {
  //   gameRef.takeDamage();

  //   Attack attack = Attack();
  //   attack.position = event.localPosition;

  //   DamageMsg dmg = DamageMsg(event.localPosition);
  //   gameRef.add(attack);
  //   gameRef.add(dmg);

  //   Future.delayed(const Duration(milliseconds: 400), () {
  //     gameRef.remove(attack);
  //   });

  //   Future.delayed(const Duration(milliseconds: 500), () {
  //     gameRef.remove(dmg);
  //   });
  // }
}
