import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/move_direction.dart';

part 'game_command.freezed.dart';

final gameCommandReciverProvider =
    StateProvider<GameCommandReceiver>((ref) => GameCommandReceiver());

class GameCommandReceiver extends StateNotifier<GameCommand> {
  GameCommandReceiver() : super(GameCommand.noOp());

  void newGame() {
    state = GameCommand.newGame();
  }

  void pauseGame() {
    state = GameCommand.pauseGame();
  }

  void setMoveDirection(MoveDirection direction) {
    state = GameCommand.moveDirection(direction);
  }
}

@freezed
class GameCommand with _$GameCommand {
  const factory GameCommand.noOp() = NoOp;
  const factory GameCommand.newGame() = NewGame;
  const factory GameCommand.pauseGame() = PauseGame;
  const factory GameCommand.moveDirection(MoveDirection direction) = Direction;
}
