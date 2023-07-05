import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../snake/utils/move_direction.dart';

final tiltRecognizerProvider =
    NotifierProvider<TiltRecognizer, MoveDirection>(() {
  return TiltRecognizer();
});

class TiltRecognizer extends Notifier<MoveDirection> {
  static const double threashold = 2;
  StreamSubscription<AccelerometerEvent>? subscription;

  void processData(AccelerometerEvent event) {
    // y < 0 => west,  y > 0 => east
    // x > 0 => south, x < 0 => north
    MoveDirection next = state;
    if (event.y < -threashold) next = MoveDirection.east;
    if (event.y > threashold) next = MoveDirection.west;
    if (event.x < -threashold) next = MoveDirection.south;
    if (event.x > threashold) next = MoveDirection.north;
    if (state != next) state = next;
  }

  set direction(MoveDirection direction) {
    if (state != direction) {
      state = direction;
    }
  }

  @override
  MoveDirection build() {
    subscription ??= accelerometerEvents.listen(processData);
    return MoveDirection.none;
  }
}
