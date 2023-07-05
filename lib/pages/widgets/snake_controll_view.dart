
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake/snake/game/game_command.dart';

import '../../snake/utils/move_direction.dart';

class SnakeControllWidget extends ConsumerWidget {
  final Color? bgColor;
  final double width;
  SnakeControllWidget({required this.width, this.bgColor, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moveDirection = ref.watch(actualMoveDirectionProvider);
    return SizedBox(
      width: width,
      height: double.infinity,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: (details) {
          RenderBox rb = context.findRenderObject() as RenderBox;
          processTap(rb.size, details, ref);
        },
        child: Container(
          color: bgColor,
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: CustomPaint(
                painter: MoveVisualizerPainter(moveDirection),
              )),
        ),
      ),
    );
  }

  void processTap(Size size, TapDownDetails details, WidgetRef ref) {
    final gameCommandReciver = ref.read(gameCommandReciverProvider);
    final y = size.height / 2;
    final l = size.shortestSide / 3;

    Rect hitRect = Rect.fromLTWH(0, y - l / 2, l, l);
    if (hitRect.contains(details.localPosition)) {
      gameCommandReciver.setMoveDirection(MoveDirection.west);
      return;
    }
    hitRect = Rect.fromLTWH(l, y - 3 / 2 * l, l, l);
    if (hitRect.contains(details.localPosition)) {
      gameCommandReciver.setMoveDirection(MoveDirection.north);
      return;
    }
    hitRect = Rect.fromLTWH(2 * l, y - l / 2, l, l);
    if (hitRect.contains(details.localPosition)) {
      gameCommandReciver.setMoveDirection(MoveDirection.east);
      return;
    }
    hitRect = Rect.fromLTWH(l, y + l / 2, l, l);
    if (hitRect.contains(details.localPosition)) {
      gameCommandReciver.setMoveDirection(MoveDirection.south);
      return;
    }
  }
}

class MoveVisualizerPainter extends CustomPainter {
  final MoveDirection moveDirection;
  late final Color circleColor, dotColor;

  MoveVisualizerPainter(
    this.moveDirection, {
    this.circleColor = Colors.white,
    this.dotColor = Colors.red,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw circle
    final circleLineWidth = 8.0;
    var radius = (size.shortestSide - circleLineWidth) / 2;
    var cx = size.width / 2;
    var cy = size.height / 2;

    var paint = Paint()
      ..color = circleColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleLineWidth;
    canvas.drawCircle(Offset(cx, cy), radius, paint);

    // Draw the dot
    final dotRadius = 16.0;

    double x = 0, y = 0;
    double offset = circleLineWidth + dotRadius + 2;
    switch (moveDirection) {
      case MoveDirection.north:
        x = cx;
        y = cy - radius + offset;
        break;
      case MoveDirection.south:
        x = cx;
        y = cy + radius - offset;
        break;
      case MoveDirection.west:
        x = cx - radius + offset;
        y = cy;
        break;
      case MoveDirection.east:
        x = cx + radius - offset;
        y = cy;
        break;
      case MoveDirection.none:
        x = cx;
        y = cy;
        break;
    }
    paint
      ..color = dotColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(x, y), dotRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
