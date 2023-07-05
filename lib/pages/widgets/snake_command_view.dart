import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../snake/game/snake_game.dart';
import '../../snake/game/game_command.dart';
import '../../snake/utils/move_direction.dart';

class SnakeCommandView extends ConsumerWidget {
  const SnakeCommandView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(snakeGameProvider);
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GameCommandButton(
            icon: Icons.home,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          game.isGameOver
              ? GameCommandButton(
                  icon: Icons.replay,
                  onPressed: () {
                    ref.read(gameCommandReciverProvider).newGame();
                    ref.read(actualMoveDirectionProvider.notifier).direction =
                        MoveDirection.none;
                  },
                )
              : GameCommandButton(
                  icon: game.isPaused ? Icons.play_arrow : Icons.pause,
                  onPressed: () {
                    ref.read(gameCommandReciverProvider).pauseGame();
                    ref.read(actualMoveDirectionProvider.notifier).direction =
                        MoveDirection.none;
                  },
                ),
          SizedBox(
            height: 24,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class GameCommandButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const GameCommandButton(
      {required this.icon, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: CircleAvatar(
        // radius: 32,
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
        ),
      ),
    );
  }
}
