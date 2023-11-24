import 'package:game_programming_patterns/game_programming_patterns.dart';
import 'package:meta/meta.dart';

@immutable
final class ExampleImmutable implements Singleton {
  /// Private const constructor.
  const ExampleImmutable._internal(this.myInt);

  /// Immutable integer field.
  final int myInt;

  /// Static instance for the class. Const as all parameters (if applicable)
  /// are constant.
  static const ExampleImmutable instance =
    ExampleImmutable._internal(0);
}

final class ExampleMutable implements Singleton {
  /// Private constructor.
  ExampleMutable._internal(this.myInt);

  /// Mutable integer field.
  int myInt;

  /// Static instance for the class. Final as all parameters (if applicable)
  /// are non-constant.
  static final ExampleMutable instance =
    ExampleMutable._internal(0);
}
