import '../utils/position.dart';

class Food {
  final int calories;
  final Position position;

  Food(this.position, this.calories);

  bool intersectsWith(Position position) => this.position == position;
}
