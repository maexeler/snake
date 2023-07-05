import 'package:snake/provider/provider_container.dart';

import '../utils/position.dart';
import '../utils/move_direction.dart';

class Snake {
  int _grow = 0;
  final List<Position> _parts;
  MoveDirection _direction, _nextDirection;

  Snake({required List<Position> positions, required MoveDirection direction})
      : _direction = direction,
        _nextDirection = direction,
        _parts = [...positions];

  MoveDirection get moveDirection {
    _direction = _nextDirection;
    return _direction;
  }

  List<Position> get parts => [..._parts];

  set moveDirection(MoveDirection direction) {
    if (_direction == MoveDirection.north && direction == MoveDirection.south ||
        _direction == MoveDirection.south && direction == MoveDirection.north ||
        _direction == MoveDirection.west && direction == MoveDirection.east ||
        _direction == MoveDirection.east && direction == MoveDirection.west) {
      return;
    }
    _nextDirection = direction;
    _notifyMoveDirectionProvider();
  }

  Position get head => _parts[0];

  void moveTo(Position position) {
    _parts.insert(0, position);
    if (_grow == 0) {
      _parts.removeLast();
    } else {
      _grow--;
    }
  }

  void eat(int? calories) {
    _grow += calories ?? 1;
  }

  bool hasSelfCollision() => _parts.skip(1).contains(_parts[0]);

  bool intersectsWith(Position position) => _parts.contains(position);

  void _notifyMoveDirectionProvider() {
    providerContainer.read(actualMoveDirectionProvider.notifier).direction =
        _nextDirection;
  }
}
