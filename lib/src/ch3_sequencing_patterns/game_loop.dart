import 'dart:io';

// https://gameprogrammingpatterns.com/game-loop.html

abstract interface class GameLoop {
  void processInput();
  void update([int? dt]);
  void render();
  void loop();
}

abstract interface class AsFastAsPossibleGameLoop implements GameLoop {
  @override
  void loop() {
    while (true) {
      processInput();
      update();
      render();
    }
  }
}

abstract interface class MinimumTimeStepGameLoop implements GameLoop {
  late int minimumMillisPerFrame;

  @override
  void loop() {
    while (true) {
      int start = DateTime.now().millisecondsSinceEpoch;
      processInput();
      update();
      render();

      // Negative if the length of the iteration exceeded expectedMillisPerFrame
      int netMillis = minimumMillisPerFrame + start -
          DateTime.now().millisecondsSinceEpoch;
      if (netMillis > 0) sleep(Duration(milliseconds: netMillis));
    }
  }
}

abstract interface class VariableTimeStepGameLoop {
  int lastTime = DateTime.now().millisecondsSinceEpoch;

  void processInput();
  void update(int dt);
  void render();

  void loop() {
    while (true) {
      int current = DateTime.now().millisecondsSinceEpoch;
      int elapsed = current - lastTime;
      processInput();
      update(elapsed);
      render();
      lastTime = current;
    }
  }
}

abstract interface class MultipleUpdatePerRenderGameLoop implements GameLoop {
  int previous = DateTime.now().millisecondsSinceEpoch;
  int lag = 0;

  int millisPerUpdate = 30;


  @override
  void loop() {
    while (true)
    {
      int current = DateTime.now().millisecondsSinceEpoch;
      int elapsed = current - previous;
      previous = current;
      lag += elapsed;

      processInput();

      while (lag >= millisPerUpdate)
      {
        update();
        lag -= millisPerUpdate;
      }

      render();
    }
  }
}

abstract interface class MultipleUpdatePerRenderGameLoopWithExtrapolation {
  int previous = DateTime.now().millisecondsSinceEpoch;
  int lag = 0;

  int millisPerUpdate = 30;

  void processInput();
  void update();
  void render(num extrapolateFrameFraction);

  @override
  void loop() {
    while (true)
    {
      int current = DateTime.now().millisecondsSinceEpoch;
      int elapsed = current - previous;
      previous = current;
      lag += elapsed;

      processInput();

      while (lag >= millisPerUpdate)
      {
        update();
        lag -= millisPerUpdate;
      }

      render(lag/millisPerUpdate);
    }
  }
}