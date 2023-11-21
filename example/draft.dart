import 'package:meta/meta.dart';

/// The goal is for the main object to change its behaviour by changing the
/// object it delegates to.
abstract interface class StatefulActor
    implements StandStillHandler, WalkHandler, JumpHandler, ActorInputHandler {
  /// Constructor with initial state.
  StatefulActor(this.state);

  /// Application specific key state.
  ActorState state;

  @override
  void onStandStill() {
    state = ActorState.standing;
  }

  @override
  void onJump() {
    state = ActorState.jumping;
  }

  @override
  void onWalk() {
    state = ActorState.walking;
  }

  @override
  void processInput(ActorEvent event) {
    if (state.respondTo.contains(event)) {
      switch (event) {
        case ActorEvent.walk:
          onWalk();
        case ActorEvent.standStill:
          onStandStill();
        case ActorEvent.jump:
          onJump();
      }
    }
  }
}

/// Finite State Machine.
enum ActorState {
  standing(respondTo: { ActorEvent.walk, ActorEvent.jump }),
  walking(respondTo: {ActorEvent.standStill}),
  jumping(respondTo: {ActorEvent.standStill});

  const ActorState({required this.respondTo});
  final Set<ActorEvent> respondTo;
}

//region Actions.
enum ActorEvent {
  standStill,
  walk,
  jump;
}
//endregion

//region Handlers
abstract interface class StandStillHandler {
  @mustBeOverridden
  onStandStill();
}

abstract interface class WalkHandler {
  @mustBeOverridden
  onWalk();
}

abstract interface class JumpHandler {
  @mustBeOverridden
  onJump();
}

abstract interface class ActorInputHandler {
  @mustBeOverridden
  processInput(ActorEvent event);
}
//endregion