/// Representative of an abstract entity that can move about a world in two
/// states, [WalkingState] and [StillState].
///
/// Dart's enhanced enums feature could be used to ensure there is only one
/// instance of each state, if appropriate.
abstract interface class Actor {
  Actor(this.movementState);

  late Image image;
  MovementState movementState = StillState(Image());

  /// Update the [MovementState] associated with the actor.
  changeMovementState(MovementState candidate) {
    movementState.exit(this);
    candidate.enter(this);
  }
}

//region GraphicState
/// Stand-in for a visual representation of an entity.
interface class Image {
  Image();
}
//endregion

//region MovementState
interface class WalkingState extends MovementState {
  const WalkingState(super.image);
}

interface class StillState extends MovementState {
  const StillState(super.image);
}

abstract interface class MovementState extends ActorState {
  const MovementState(this.image);
  final Image image;

  @override
  void enter(Actor actor) {
    // Set a 'still' animation / sprite
    actor.image = image;
  }

  @override
  void exit(Actor actor) {
    // Dispose of any resources
  }
}

/// A very simple foundation for any kind of [State] that performs steps on
/// initialisation and finalisation.
abstract interface class ActorState {
  const ActorState();
  void enter(Actor actor);
  void exit(Actor actor);
}
//endregion