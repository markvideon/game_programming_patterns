/// An event queue... queues events. E.g. An audio playlist, input events.
///
/// A [Stream] may be a suitable structure, users may also be tempted by
/// [ListQueue] which *does not* remain at its fixed capacity...
///
/// TBD whether implementing a custom data structure is worthwhile.
///
/// https://gameprogrammingpatterns.com/event-queue.html
