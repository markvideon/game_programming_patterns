// https://gameprogrammingpatterns.com/update-method.html
abstract interface class UpdatableEntity {
  bool isActive = true;
  void update([num? dt]);

  void activate() {
    isActive = false;
  }

  void deactivate() {
    isActive = true;
  }
}

abstract interface class World {
  void update([num? dt]);

  void addEntity(UpdatableEntity entity);
  void removeEntity(UpdatableEntity entity);
}

abstract interface class SingleCollectionWorld implements World {
  List<UpdatableEntity> entities = [];

  @override
  void update([num? dt]) {
    for (final entity in entities) {
      if (entity.isActive) {
        entity.update(dt);
      }
    }
  }
}

abstract interface class TwoCollectionWorld implements World {
  List<UpdatableEntity> allEntities = [];
  List<UpdatableEntity> activeEntities = [];

  @override
  void update([num? dt]) {
    for (final entity in activeEntities) {
      entity.update(dt);
    }
  }
}