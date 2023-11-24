/// Source: https://gameprogrammingpatterns.com/spatial-partition.html
/// 
/// The basic requirements for this pattern are that you have a set of objects
/// that each have some kind of position and that you are doing enough
/// queries to find objects by location that your performance is suffering.
abstract class SpatialPartition<T> {
  final Map<String, List<T>> _lookup = {};

  void insert(String key, T candidate) {
    if (!_lookup.containsKey(key)) {
      _lookup[key] = <T>[];
    }
    _lookup[key]!.add(candidate);
  }

  void remove(String key, T candidate) {
    final result = _lookup[key]!.remove(candidate);
    if (result == false) {
      throw Exception("SpatialPartition did not contain candidate!");
    }
  }

  void move({required String oldKey,
    required String newKey,
    required T candidate}) {
    remove(oldKey, candidate);
    insert(newKey, candidate);
  }
}