import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/snake_game_view.dart';
import 'widgets/snake_command_view.dart';
import 'widgets/snake_controll_view.dart';
import 'widgets/snake_score_view.dart';

class SnakeGamePage extends ConsumerStatefulWidget {
  const SnakeGamePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SnakeGamePageState();
}

class _SnakeGamePageState extends ConsumerState<SnakeGamePage> {
  final Color bgColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    return Scaffold(
      body: Container(
        color: bgColor,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: SnakeScoreView()),
                  SnakeCommandView(),
                ],
              ),
            ),
            SnakeGameViewWidget(
                // bgColor: Colors.black,
                ),
            SnakeControllWidget(
              width: 200,
              // bgColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // Game is always in landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  dispose() {
    // Set mode back to system preference
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }
}
