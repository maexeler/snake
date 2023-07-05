import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:snake/snake/utils/move_direction.dart';

import 'game_logic.dart';
import 'game_command.dart';
import 'level.dart';

final snakeGameProvider =
    // Use the snakeGameProvider only after the game is fuiiy initialized
    ChangeNotifierProvider<SnakeGame>((ref) => throw UnimplementedError());

class SnakeGame extends ChangeNotifier {
  int _levelNbr = 0;
  late GameLogic _gameLogic;
  late int gameScore, levelScore;
  late bool _isPaused, _isGameOver;

  SnakeGame() {
    _gameLogic = GameLogic(this);
  }

  bool get isPaused => _isPaused;

  Level get level => _gameLogic.level;

  set isPaused(bool value) {
    _isPaused = value;
    needsRedraw();
  }

  bool get isGameOver => _isGameOver;
  set isGameOver(bool value) {
    _isGameOver = value;
    if (_isGameOver) _gameLogic.setMoveDiretion(MoveDirection.none);
    needsRedraw();
  }

  void addScorePoints(int points) {
    gameScore += points;
    levelScore += points;
    needsRedraw();
  }

  int get levelNbr => _levelNbr;
  set levelNbr(int levelNbr) {
    levelScore = 0;
    _levelNbr = levelNbr;
    needsRedraw();
  }

  void processGameCommand(GameCommand command) {
    command.when(
      moveDirection: (direction) {
        if (isGameOver) return;

        _gameLogic.setMoveDiretion(direction);
        isPaused = false;
      },
      newGame: newGame,
      pauseGame: () {
        isPaused = !isPaused;
        needsRedraw();
      },
      noOp: () {},
    );
  }

  void newGame() {
    isPaused = true;
    isGameOver = false;
    gameScore = 0;
    _gameLogic.newGame();
    needsRedraw();
  }

  void needsRedraw() {
    notifyListeners();
  }
}
