import '../utils/position.dart';
import '../utils/move_direction.dart';

class Desert {
  final int dimension;

  Desert({required this.dimension});

  Position nextPosition(Position from, MoveDirection direction) {
    int x = from.x, y = from.y;
    switch (direction) {
      case MoveDirection.north:
        y--;
        break;
      case MoveDirection.south:
        y++;
        break;
      case MoveDirection.east:
        x++;
        break;
      case MoveDirection.west:
        x--;
        break;
      case MoveDirection.none:
        break;
    }
    x = x < 0
        ? dimension - 1
        : x >= dimension
            ? 0
            : x;
    y = y < 0
        ? dimension - 1
        : y >= dimension
            ? 0
            : y;
    return Position(x, y);
  }
}
