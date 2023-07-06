import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake/snake/game/game_config.dart';

class SnakeConfigPage extends ConsumerWidget {
  const SnakeConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prortrait = MediaQuery.orientationOf(context) == Orientation.portrait;
    return Scaffold(
      appBar: AppBar(
        title: Text('Snake Configuration'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: prortrait
            ? Column(children: [
                SizeForm(),
                VelocityForm(),
              ])
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: SizeForm()),
                  Expanded(child: VelocityForm()),
                ],
              ),
      ),
    );
  }
}

class VelocityForm extends StatelessWidget {
  const VelocityForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Game velocity',
          style: TextStyle(fontSize: 25),
        ),
        VelocityCheckbox(GameVelocity.slow, 'Slow'),
        VelocityCheckbox(GameVelocity.easy, 'Easy'),
        VelocityCheckbox(GameVelocity.difficult, 'Difficult'),
        VelocityCheckbox(GameVelocity.fast, 'Fast'),
      ],
    );
  }
}

class VelocityCheckbox extends ConsumerWidget {
  final String title;
  final GameVelocity velocity;

  const VelocityCheckbox(this.velocity, this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var actual = ref.watch(gameVelocityProvider);
    return CheckboxListTile(
      value: actual == velocity,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        ref.read(gameVelocityProvider.notifier).velocity(velocity);
      },
      title: Text(title),
    );
  }
}

class SizeForm extends StatelessWidget {
  const SizeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Game Size',
          style: TextStyle(fontSize: 25),
        ),
        SizeCheckbox(GameSize.small, 'Smal'),
        SizeCheckbox(GameSize.normal, 'Normal'),
        SizeCheckbox(GameSize.big, 'Big'),
      ],
    );
  }
}

class SizeCheckbox extends ConsumerWidget {
  final String title;
  final GameSize size;

  const SizeCheckbox(this.size, this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var actual = ref.watch(gameSizeProvider);
    return CheckboxListTile(
      value: actual == size,
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (bool? value) {
        ref.read(gameSizeProvider.notifier).size(size);
      },
      title: Text(title),
    );
  }
}
