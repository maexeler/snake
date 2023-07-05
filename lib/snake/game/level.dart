import 'dart:math';

import 'package:snake/snake/utils/move_direction.dart';

import '../utils/position.dart';

import '../model/food.dart';
import '../model/snake.dart';
import '../model/desert.dart';
import '../model/obstacles.dart';

class Level {
  static final Random rnd = Random();
  static final Food _invalidFood = Food(Position(-42, -42), 1);

  factory Level.createFirstLevel(int gameDimension) {
    return Level(desertSize: gameDimension);
  }

  factory Level.createNextLevel(Level level) {
    level._levelNbr++;
    level.removeFood();
    return level;
  }

  Food _food;
  int _levelNbr;
  final Desert desert;
  late final Snake snake;
  final Obstacles obstacles;

  Level({required desertSize})
      : _levelNbr = 1,
        _food = _invalidFood,
        desert = Desert(dimension: desertSize),
        obstacles = Obstacles(desertSize) {
    _createSnake();
    _replaceFood();
  }

  Food get food => _food;

  get levelNbr => _levelNbr;

  void removeFood() {
    _food = _invalidFood;
  }

  void updateFood() {
    if (food == _invalidFood &&
        (obstacles.hasAllGatesClosed || !obstacles.gateIsEmpty)) {
      _replaceFood();
    }
  }

  bool hasFinished(int levelScore) {
    return levelScore > 3 + rnd.nextInt(_levelNbr);
  }

  void _replaceFood() {
    final int calories = 1 + rnd.nextInt(levelNbr);
    for (int i = 0; i < 1000; ++i) {
      Position position = Position(
          rnd.nextInt(desert.dimension), rnd.nextInt(desert.dimension));
      if (!snake.intersectsWith(position) &&
          !obstacles.intersectsWith(position)) {
        _food = Food(position, calories);
        return;
      }
    }
    // failed to find a free position, use an invalid position
    removeFood();
  }

  void _createSnake() {
    int lenght = desert.dimension;
    MoveDirection direction =
        MoveDirection.values[rnd.nextInt(MoveDirection.values.length - 1)];
    int x = 0, y = 0;
    final List<Position> parts = [];
    switch (direction) {
      case MoveDirection.north:
        x = _intervall(1, 2, lenght);
        y = _intervall(2, 4, lenght);
        final head = Position(x, y);
        parts.add(head);
        parts.add(Position(head.x, head.y + 1));
        parts.add(Position(head.x, head.y + 2));
        break;
      case MoveDirection.south:
        x = _intervall(1, 2, lenght);
        y = _intervall(3, 3, lenght);
        final head = Position(x, y);
        parts.add(head);
        parts.add(Position(head.x, head.y - 1));
        parts.add(Position(head.x, head.y - 2));

        break;
      case MoveDirection.west:
        x = _intervall(2, 4, lenght);
        y = _intervall(1, 2, lenght);
        final head = Position(x, y);
        parts.add(head);
        parts.add(Position(head.x + 1, head.y));
        parts.add(Position(head.x + 2, head.y));
        break;
      case MoveDirection.east:
        x = _intervall(3, 3, lenght);
        y = _intervall(1, 2, lenght);
        final head = Position(x, y);
        parts.add(head);
        parts.add(Position(head.x - 1, head.y));
        parts.add(Position(head.x - 2, head.y));
        break;
      case MoveDirection.none:
        break; // not reached by rnd
    }
    snake = Snake(positions: parts, direction: direction);
    snake.moveDirection = direction; // trigger notify
  }

  int _intervall(int a, int b, int l) {
    return a + rnd.nextInt(l - a - b + 1);
  }
}
