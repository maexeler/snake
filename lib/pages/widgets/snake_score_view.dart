import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:snake/snake/game/snake_game.dart';

class SnakeScoreView extends ConsumerWidget {
  const SnakeScoreView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snakeGame = ref.watch(snakeGameProvider);
    final headerStyle = TextStyle(
      color: Colors.greenAccent,
      fontSize: 18,
    );
    final scoreStyle = TextStyle(
      color: Colors.greenAccent,
      fontSize: headerStyle.fontSize! * 1.5,
    );
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(child: GameOverWidget()),
            Row(
              children: [
                Text('Level:', style: headerStyle),
                Expanded(child: Container()),
                Text('${snakeGame.levelNbr}', style: scoreStyle),
              ],
            ),
            Row(children: [
              Text('Score:', style: headerStyle),
              Expanded(child: Container()),
              Text('${11 * snakeGame.gameScore}', style: scoreStyle),
            ]),
          ],
        ),
      ),
    );
  }
}

class GameOverWidget extends HookConsumerWidget {
  const GameOverWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snakeGame = ref.watch(snakeGameProvider);
    final scoreStyle = TextStyle(
      color: Colors.greenAccent,
      fontSize: 18 * 1.5,
    );
    final controller =
        useAnimationController(duration: Duration(milliseconds: 2000));
    final animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    controller.repeat(reverse: true);
    // controller.repeat();

    return snakeGame.isGameOver
        ? ScaleTransition(
            scale: animation,
            child: Center(
              child: Text('Game Over', style: scoreStyle),
            ),
          )
        : Container();
  }
}
