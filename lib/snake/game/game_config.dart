import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum GameVelocity { slow, easy, difficult, fast }

final gameVelocityProvider =
    NotifierProvider<VelocityProvider, GameVelocity>(() => VelocityProvider());

class VelocityProvider extends Notifier<GameVelocity> {
  @override
  GameVelocity build() => GameVelocity.easy;

  void velocity(GameVelocity velocity) {
    state = velocity;
    save();
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

  void save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('velocity', state.index);
  }

  void load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = GameVelocity.values[prefs.getInt('velocity') ?? 1];
  }
}

enum GameSize { small, normal, big }

final gameSizeProvider =
    NotifierProvider<SizeProvider, GameSize>(() => SizeProvider());

class SizeProvider extends Notifier<GameSize> {
  @override
  GameSize build() => GameSize.normal;

  void size(GameSize size) {
    state = size;
    save();
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

  void save() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('gameSize', state.index);
  }

  void load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    state = GameSize.values[prefs.getInt('gameSize') ?? 1];
  }
}
