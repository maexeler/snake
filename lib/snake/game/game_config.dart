import 'package:hooks_riverpod/hooks_riverpod.dart';

enum GameVelocity { slow, easy, difficult, fast }

final gameVelocityProvider =
    NotifierProvider<VelocityProvider, GameVelocity>(() => VelocityProvider());

class VelocityProvider extends Notifier<GameVelocity> {
  @override
  GameVelocity build() => GameVelocity.easy;

  set velocity(GameVelocity velocity) {
    state = velocity;
  }

  int get msForTimer {
    switch (state) {
      case GameVelocity.slow:
        return 500;
      case GameVelocity.easy:
        return 350;
      case GameVelocity.difficult:
        return 250;
      case GameVelocity.fast:
        return 350;
    }
  }

  int getScoreForVelocity(int calories) {
    switch (state) {
      case GameVelocity.slow:
        return calories * 2;
      case GameVelocity.easy:
        return calories * 4;
      case GameVelocity.difficult:
        return calories * 6;
      case GameVelocity.fast:
        return calories * 10;
    }
  }
}

enum GameSize { small, normal, big }

final gameSizeProvider =
    NotifierProvider<SizeProvider, GameSize>(() => SizeProvider());

class SizeProvider extends Notifier<GameSize> {
  @override
  GameSize build() => GameSize.normal;

  set size(GameSize size) {
    state = size;
  }

  int get gameSize {
    switch (state) {
      case GameSize.small:
        return 10;
      case GameSize.normal:
        return 15;
      case GameSize.big:
        return 20;
    }
  }
}
