import 'package:meta/meta.dart';

/// Flyweight is about instantiating the same object in large quantities.
abstract class Flyweight {
  late final FlyweightSharedData sharedData;
  late final List<FlyweightInstance> instances;
}

abstract class FlyweightInstance {
  // Application-specific data
}

@immutable
abstract class FlyweightSharedData {
  // Application-specific data
}