import 'dart:async';

import 'package:snake/provider/provider_container.dart';
import 'package:snake/snake/game/game_config.dart';

import 'level.dart';
import 'snake_game.dart';
import '../utils/move_direction.dart';

class GameLogic {
  final SnakeGame game;
  late Level level;
  Timer? timer;

  GameLogic(this.game);

  void tick() {
    if (game.isGameOver || game.isPaused) {
      return;
    }
    var snake = level.snake;
    var desert = level.desert;
    var obstacles = level.obstacles;
    // move Snake
    snake.moveTo(desert.nextPosition(snake.head, snake.moveDirection));
    obstacles.manageGates(snake.parts);

    // try to eat
    var food = level.food;
    if (food.intersectsWith(snake.head)) {
      snake.eat(food.calories);
      level.removeFood();
      game.addScorePoints(food.calories);
    }

    // are we dead now?
    if (snake.hasSelfCollision() || obstacles.intersectsWith(snake.head)) {
      game.isGameOver = true;
    }

    // level finished?
    if (level.hasFinished(game.levelScore)) {
      obstacles.openEntryGate();
      level = Level.createNextLevel(level);
      game.levelNbr = level.levelNbr;
    }
    level.updateFood();

    game.needsRedraw();
  }

  void setMoveDiretion(MoveDirection direction) {
    level.snake.moveDirection = direction;
  }

  void newGame() {
    var gameSize = providerContainer.read(gameSizeProvider.notifier).gameSize;
    level = Level.createFirstLevel(gameSize);
    var tickTime =
        providerContainer.read(gameVelocityProvider.notifier).msForTimer;
    startTimer(tickTime);
    game.levelNbr = level.levelNbr;
  }

  void startTimer(int milliseconds) {
    timer?.cancel();
    timer = Timer.periodic(Duration(milliseconds: milliseconds), (timer) {
      tick();
    });
  }
}
