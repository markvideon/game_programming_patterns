import 'dart:collection';

abstract class ObservableEvent { /* Application-specific definition */ }

abstract class Entity { /* Application-specific definition */ }

abstract interface class Observer {
  onNotify(Entity entity, ObservableEvent event);

  _ObserverLinkedListEntry _toLinkedListEntry() {
    return _ObserverLinkedListEntry(this);
  }
}

final class _ObserverLinkedListEntry extends LinkedListEntry<_ObserverLinkedListEntry> {
  _ObserverLinkedListEntry(this.value);
  Observer value;
}

abstract class Subject {
  final LinkedList<_ObserverLinkedListEntry>
    _observers = LinkedList<_ObserverLinkedListEntry>();

  addObserver(Observer candidate) {
    _observers.add(candidate._toLinkedListEntry());
  }

  removeObserver(Observer candidate) {
    _observers.remove(candidate._toLinkedListEntry());
  }

  notify(Entity entity, ObservableEvent event) {
    for (final observer in _observers) {
      observer.value.onNotify(entity, event);
    }
  }
}