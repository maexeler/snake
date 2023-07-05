import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake/pages/snake_config_page.dart';
import 'package:snake/pages/snake_game_page.dart';
import 'package:snake/pages/widgets/util/ascii_art.dart';
import 'package:snake/snake/utils/move_direction.dart';

import '../snake/game/game_command.dart';

class SnakeGameStartPage extends StatelessWidget {
  const SnakeGameStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => SnakeConfigPage()),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SnakeHeader(),
              Expanded(child: Text('gaga')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: Text('')),
                  Expanded(child: SnakeStart()),
                  Expanded(child: Text('')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SnakeHeader extends StatelessWidget {
  const SnakeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AsciiArt(
      '''
█████████████████████████████████████████


███████ ███    ██  █████  ██   ██ ███████ 
██      ████   ██ ██   ██ ██  ██  ██      
███████ ██ ██  ██ ███████ █████   █████   
     ██ ██  ██ ██ ██   ██ ██  ██  ██      
███████ ██   ████ ██   ██ ██   ██ ███████


█████████████████████████████████████████
''',
      Colors.greenAccent,
      // bgColor: Colors.black,
    );
  }
}

class SnakeStart extends ConsumerWidget {
  const SnakeStart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(gameCommandReciverProvider).newGame();
        ref.read(actualMoveDirectionProvider.notifier).direction =
            MoveDirection.none;
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SnakeGamePage()),
        );
      },
      child: AsciiArt(
        '''
███████████████████████████████████████████
██                                       ██
██                                       ██
██ ███████ ██████   ██    █████   ██████ ██
██ ██        ██    ██ ██  ██  ██    ██   ██
██ ███████   ██   ███████ █████     ██   ██
██      ██   ██   ██   ██ ██  ██    ██   ██
██ ███████   ██   ██   ██ ██   ██   ██   ██
██                                       ██
██                                       ██
███████████████████████████████████████████
''',
        Colors.greenAccent,
        // bgColor: Colors.black,
      ),
    );
  }
}
