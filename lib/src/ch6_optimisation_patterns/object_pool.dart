// https://gameprogrammingpatterns.com/object-pool.html
abstract class ObjectPool<T> {
  ObjectPool({
    required this.builder,
    required this.isEnabled,
    required this.length,
  }) {
    elements = List.generate(length, (index) => builder(index));
  }

  final T Function(int) builder;
  final bool Function(T) isEnabled;
  final int length;
  late final List<T> elements;

  void enable();
  void disable();
}