import 'dart:math';

import '../utils/position.dart';

enum GateState { closed, gateOpen, gateEntered, gateInUse }

class Obstacles {
  static final Random rnd = Random();

  final int dimensions;
  final List<Position> _obstaclePositions = [];

  Position _entryGate = Position(-1, -1);
  Position _exitGate = Position(-1, -1);
  GateState _gateState = GateState.closed;

  Obstacles(this.dimensions) {
    for (int x = 0; x < dimensions; ++x) {
      _obstaclePositions.add(Position(x, 0));
      _obstaclePositions.add(Position(x, dimensions - 1));
    }
    for (int y = 1; y < dimensions - 1; ++y) {
      _obstaclePositions.add(Position(0, y));
      _obstaclePositions.add(Position(dimensions - 1, y));
    }
  }

  List<Position> get parts => [..._obstaclePositions];

  bool get hasAllGatesClosed => _gateState == GateState.closed;

  bool get gateIsEmpty => _gateState == GateState.gateOpen;

  bool intersectsWith(Position position) =>
      _obstaclePositions.contains(position);

  void openEntryGate() {
    int rndPos = 1 + rnd.nextInt(dimensions - 2);
    if (rnd.nextBool()) {
      _entryGate = Position(rndPos, 0);
      _exitGate = Position(rndPos, dimensions - 1);
    } else {
      _entryGate = Position(0, rndPos);
      _exitGate = Position(dimensions - 1, rndPos);
    }
    _obstaclePositions.remove(_entryGate);
    _gateState = GateState.gateOpen;
  }

  void manageGates(List<Position> positions) {
    switch (_gateState) {
      case GateState.closed:
        break; // nothing to do
      case GateState.gateOpen:
        if (positions.contains(_entryGate)) {
          _gateState = GateState.gateEntered;
          _obstaclePositions.remove(_exitGate);
        }
        break;
      case GateState.gateEntered:
        if (positions.contains(_exitGate)) {
          _gateState = GateState.gateInUse;
        }
        break;
      case GateState.gateInUse:
        if (!positions.contains(_entryGate)) {
          _obstaclePositions.add(_entryGate);
        }
        if (!positions.contains(_exitGate)) {
          _obstaclePositions.add(_exitGate);
          _gateState = GateState.closed;
        }
    }
  }
}
