import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../snake/utils/position.dart';
import '../../snake/game/snake_game.dart';

class SnakeGameViewWidget extends StatelessWidget {
  final Color? bgColor;
  const SnakeGameViewWidget({this.bgColor, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 32,
      width: MediaQuery.of(context).size.height - 32,
      child: SnakeScene(bgColor: bgColor),
    );
  }
}

class SnakeScene extends ConsumerWidget {
  final Color? bgColor;
  const SnakeScene({this.bgColor, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(snakeGameProvider);
    return Container(
      color: bgColor,
      child: CustomPaint(
        painter: SnakeScenePainter(game),
      ),
    );
  }
}

class SnakeScenePainter extends CustomPainter {
  final SnakeGame game;
  SnakeScenePainter(this.game);

  @override
  void paint(Canvas canvas, Size size) {
    final level = game.level;
    var dx = size.width / level.desert.dimension;
    var dy = size.height / level.desert.dimension;

    final textStyle = TextStyle(
      color: Colors.greenAccent,
      fontSize: dy,
    );

    // Draw obstacles
    final obstacleParts = level.obstacles.parts;
    for (var part in obstacleParts) {
      drawText('*', part, dx, dy, textStyle, canvas);
    }

    // Draw snake
    final snakeParts = level.snake.parts;
    snakeParts.skip(1).forEach((part) {
      drawText('X', part, dx, dy, textStyle, canvas);
    });
    drawText('O', snakeParts[0], dx, dy, textStyle, canvas);

    // Draw food
    final food = level.food;
    drawText(level.food.calories > 1 ? '@' : '%', food.position, dx, dy,
        textStyle, canvas);
  }

  void drawText(String text, Position position, double dx, double dy,
      TextStyle style, Canvas canvas) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: 1,
    )..layout();

    final x = dx * position.x;
    final y = dy * position.y;
    textPainter.paint(canvas, Offset(x, y));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
