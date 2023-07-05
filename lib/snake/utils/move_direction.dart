import 'package:hooks_riverpod/hooks_riverpod.dart';

enum MoveDirection { north, south, east, west, none }

final actualMoveDirectionProvider =
    NotifierProvider<ActualMoveDirection, MoveDirection>(
        () => ActualMoveDirection());

class ActualMoveDirection extends Notifier<MoveDirection> {
  @override
  MoveDirection build() => MoveDirection.none;

  set direction(MoveDirection direction) {
    state = direction;
  }
}
