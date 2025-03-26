// import 'dart:math';

// import 'package:flame/components.dart';
// import 'package:flame/game.dart';
// import 'package:flutter/widgets.dart';
// import 'package:learnflame/model/insect.dart';
// import 'dart:async' as asy;

// class GameScreen extends FlameGame {
//   SpriteComponent bg = SpriteComponent();
//   asy.Timer? _timer;

//   TextPaint tp = TextPaint();

//   @override
//   Future<void> onLoad() async {
//     bg
//       ..sprite = await Sprite.load("backgrounds/bg 2.jpg")
//       ..size = Vector2(size[0], size[1] / 1.3);
//     add(bg);

//     _timer = asy.Timer.periodic(
//       const Duration(milliseconds: 500),
//       (timer) {
//         double randXPos = Random().nextInt(size[0].toInt()).toDouble();
//         int randSpeed = Random().nextInt(200) + 150;
//         Insect s1 = Insect(
//           xPos: randXPos,
//           yPos: 0,
//           speed: randSpeed,
//         );
//         add(s1);
//       },
//     );
//   }

//   @override
//   void render(Canvas canvas) async {
//     super.render(canvas);
//     tp.render(canvas, "HELLO", Vector2(0, size[1] / 1.3));
//   }
// }
