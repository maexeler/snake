// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameCommand {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noOp,
    required TResult Function() newGame,
    required TResult Function() pauseGame,
    required TResult Function(MoveDirection direction) moveDirection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noOp,
    TResult? Function()? newGame,
    TResult? Function()? pauseGame,
    TResult? Function(MoveDirection direction)? moveDirection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noOp,
    TResult Function()? newGame,
    TResult Function()? pauseGame,
    TResult Function(MoveDirection direction)? moveDirection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoOp value) noOp,
    required TResult Function(NewGame value) newGame,
    required TResult Function(PauseGame value) pauseGame,
    required TResult Function(Direction value) moveDirection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoOp value)? noOp,
    TResult? Function(NewGame value)? newGame,
    TResult? Function(PauseGame value)? pauseGame,
    TResult? Function(Direction value)? moveDirection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoOp value)? noOp,
    TResult Function(NewGame value)? newGame,
    TResult Function(PauseGame value)? pauseGame,
    TResult Function(Direction value)? moveDirection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCommandCopyWith<$Res> {
  factory $GameCommandCopyWith(
          GameCommand value, $Res Function(GameCommand) then) =
      _$GameCommandCopyWithImpl<$Res, GameCommand>;
}

/// @nodoc
class _$GameCommandCopyWithImpl<$Res, $Val extends GameCommand>
    implements $GameCommandCopyWith<$Res> {
  _$GameCommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoOpCopyWith<$Res> {
  factory _$$NoOpCopyWith(_$NoOp value, $Res Function(_$NoOp) then) =
      __$$NoOpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoOpCopyWithImpl<$Res> extends _$GameCommandCopyWithImpl<$Res, _$NoOp>
    implements _$$NoOpCopyWith<$Res> {
  __$$NoOpCopyWithImpl(_$NoOp _value, $Res Function(_$NoOp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoOp implements NoOp {
  const _$NoOp();

  @override
  String toString() {
    return 'GameCommand.noOp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoOp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noOp,
    required TResult Function() newGame,
    required TResult Function() pauseGame,
    required TResult Function(MoveDirection direction) moveDirection,
  }) {
    return noOp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noOp,
    TResult? Function()? newGame,
    TResult? Function()? pauseGame,
    TResult? Function(MoveDirection direction)? moveDirection,
  }) {
    return noOp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noOp,
    TResult Function()? newGame,
    TResult Function()? pauseGame,
    TResult Function(MoveDirection direction)? moveDirection,
    required TResult orElse(),
  }) {
    if (noOp != null) {
      return noOp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoOp value) noOp,
    required TResult Function(NewGame value) newGame,
    required TResult Function(PauseGame value) pauseGame,
    required TResult Function(Direction value) moveDirection,
  }) {
    return noOp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoOp value)? noOp,
    TResult? Function(NewGame value)? newGame,
    TResult? Function(PauseGame value)? pauseGame,
    TResult? Function(Direction value)? moveDirection,
  }) {
    return noOp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoOp value)? noOp,
    TResult Function(NewGame value)? newGame,
    TResult Function(PauseGame value)? pauseGame,
    TResult Function(Direction value)? moveDirection,
    required TResult orElse(),
  }) {
    if (noOp != null) {
      return noOp(this);
    }
    return orElse();
  }
}

abstract class NoOp implements GameCommand {
  const factory NoOp() = _$NoOp;
}

/// @nodoc
abstract class _$$NewGameCopyWith<$Res> {
  factory _$$NewGameCopyWith(_$NewGame value, $Res Function(_$NewGame) then) =
      __$$NewGameCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NewGameCopyWithImpl<$Res>
    extends _$GameCommandCopyWithImpl<$Res, _$NewGame>
    implements _$$NewGameCopyWith<$Res> {
  __$$NewGameCopyWithImpl(_$NewGame _value, $Res Function(_$NewGame) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NewGame implements NewGame {
  const _$NewGame();

  @override
  String toString() {
    return 'GameCommand.newGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NewGame);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noOp,
    required TResult Function() newGame,
    required TResult Function() pauseGame,
    required TResult Function(MoveDirection direction) moveDirection,
  }) {
    return newGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noOp,
    TResult? Function()? newGame,
    TResult? Function()? pauseGame,
    TResult? Function(MoveDirection direction)? moveDirection,
  }) {
    return newGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noOp,
    TResult Function()? newGame,
    TResult Function()? pauseGame,
    TResult Function(MoveDirection direction)? moveDirection,
    required TResult orElse(),
  }) {
    if (newGame != null) {
      return newGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoOp value) noOp,
    required TResult Function(NewGame value) newGame,
    required TResult Function(PauseGame value) pauseGame,
    required TResult Function(Direction value) moveDirection,
  }) {
    return newGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoOp value)? noOp,
    TResult? Function(NewGame value)? newGame,
    TResult? Function(PauseGame value)? pauseGame,
    TResult? Function(Direction value)? moveDirection,
  }) {
    return newGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoOp value)? noOp,
    TResult Function(NewGame value)? newGame,
    TResult Function(PauseGame value)? pauseGame,
    TResult Function(Direction value)? moveDirection,
    required TResult orElse(),
  }) {
    if (newGame != null) {
      return newGame(this);
    }
    return orElse();
  }
}

abstract class NewGame implements GameCommand {
  const factory NewGame() = _$NewGame;
}

/// @nodoc
abstract class _$$PauseGameCopyWith<$Res> {
  factory _$$PauseGameCopyWith(
          _$PauseGame value, $Res Function(_$PauseGame) then) =
      __$$PauseGameCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseGameCopyWithImpl<$Res>
    extends _$GameCommandCopyWithImpl<$Res, _$PauseGame>
    implements _$$PauseGameCopyWith<$Res> {
  __$$PauseGameCopyWithImpl(
      _$PauseGame _value, $Res Function(_$PauseGame) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PauseGame implements PauseGame {
  const _$PauseGame();

  @override
  String toString() {
    return 'GameCommand.pauseGame()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseGame);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noOp,
    required TResult Function() newGame,
    required TResult Function() pauseGame,
    required TResult Function(MoveDirection direction) moveDirection,
  }) {
    return pauseGame();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noOp,
    TResult? Function()? newGame,
    TResult? Function()? pauseGame,
    TResult? Function(MoveDirection direction)? moveDirection,
  }) {
    return pauseGame?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noOp,
    TResult Function()? newGame,
    TResult Function()? pauseGame,
    TResult Function(MoveDirection direction)? moveDirection,
    required TResult orElse(),
  }) {
    if (pauseGame != null) {
      return pauseGame();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoOp value) noOp,
    required TResult Function(NewGame value) newGame,
    required TResult Function(PauseGame value) pauseGame,
    required TResult Function(Direction value) moveDirection,
  }) {
    return pauseGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoOp value)? noOp,
    TResult? Function(NewGame value)? newGame,
    TResult? Function(PauseGame value)? pauseGame,
    TResult? Function(Direction value)? moveDirection,
  }) {
    return pauseGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoOp value)? noOp,
    TResult Function(NewGame value)? newGame,
    TResult Function(PauseGame value)? pauseGame,
    TResult Function(Direction value)? moveDirection,
    required TResult orElse(),
  }) {
    if (pauseGame != null) {
      return pauseGame(this);
    }
    return orElse();
  }
}

abstract class PauseGame implements GameCommand {
  const factory PauseGame() = _$PauseGame;
}

/// @nodoc
abstract class _$$DirectionCopyWith<$Res> {
  factory _$$DirectionCopyWith(
          _$Direction value, $Res Function(_$Direction) then) =
      __$$DirectionCopyWithImpl<$Res>;
  @useResult
  $Res call({MoveDirection direction});
}

/// @nodoc
class __$$DirectionCopyWithImpl<$Res>
    extends _$GameCommandCopyWithImpl<$Res, _$Direction>
    implements _$$DirectionCopyWith<$Res> {
  __$$DirectionCopyWithImpl(
      _$Direction _value, $Res Function(_$Direction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = null,
  }) {
    return _then(_$Direction(
      null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as MoveDirection,
    ));
  }
}

/// @nodoc

class _$Direction implements Direction {
  const _$Direction(this.direction);

  @override
  final MoveDirection direction;

  @override
  String toString() {
    return 'GameCommand.moveDirection(direction: $direction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Direction &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectionCopyWith<_$Direction> get copyWith =>
      __$$DirectionCopyWithImpl<_$Direction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noOp,
    required TResult Function() newGame,
    required TResult Function() pauseGame,
    required TResult Function(MoveDirection direction) moveDirection,
  }) {
    return moveDirection(direction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noOp,
    TResult? Function()? newGame,
    TResult? Function()? pauseGame,
    TResult? Function(MoveDirection direction)? moveDirection,
  }) {
    return moveDirection?.call(direction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noOp,
    TResult Function()? newGame,
    TResult Function()? pauseGame,
    TResult Function(MoveDirection direction)? moveDirection,
    required TResult orElse(),
  }) {
    if (moveDirection != null) {
      return moveDirection(direction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoOp value) noOp,
    required TResult Function(NewGame value) newGame,
    required TResult Function(PauseGame value) pauseGame,
    required TResult Function(Direction value) moveDirection,
  }) {
    return moveDirection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NoOp value)? noOp,
    TResult? Function(NewGame value)? newGame,
    TResult? Function(PauseGame value)? pauseGame,
    TResult? Function(Direction value)? moveDirection,
  }) {
    return moveDirection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoOp value)? noOp,
    TResult Function(NewGame value)? newGame,
    TResult Function(PauseGame value)? pauseGame,
    TResult Function(Direction value)? moveDirection,
    required TResult orElse(),
  }) {
    if (moveDirection != null) {
      return moveDirection(this);
    }
    return orElse();
  }
}

abstract class Direction implements GameCommand {
  const factory Direction(final MoveDirection direction) = _$Direction;

  MoveDirection get direction;
  @JsonKey(ignore: true)
  _$$DirectionCopyWith<_$Direction> get copyWith =>
      throw _privateConstructorUsedError;
}
