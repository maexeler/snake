import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'pages/snake_game_start_page.dart';
import 'provider/provider_container.dart';
import 'snake/game/game_command.dart';
import 'snake/game/snake_game.dart';

void main() {
  // Create the game
  SnakeGame snakeGame = SnakeGame();
  // and connect it to a [GameCommandReceiver]
  providerContainer.read(gameCommandReciverProvider).addListener((state) {
    snakeGame.processGameCommand(state);
  });

  runApp(ProviderScope(
    // We are initialized and ready. Let's serve the world
    overrides: [snakeGameProvider.overrideWith((ref) => snakeGame)],
    parent: providerContainer,
    child: SnakeApp(),
  ));
}

class SnakeApp extends StatelessWidget {
  SnakeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snake',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SnakeGameStartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
