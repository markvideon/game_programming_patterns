abstract interface class SwappableDoubleBuffer<T> {
  SwappableDoubleBuffer(this.readable, this._writable) {
    _worker = this.readable;
  }
  
  late T _worker;
  T readable;
  T _writable;
  bool _isLocked = false;

  /// Returns the readable buffer.
  T? read() {
    if (_isLocked) {
      return null;
    }
    return readable;
  }

  /// Swap the buffers.
  void swap() {
    _isLocked = true;
    _worker = readable;
    readable = _writable;
    _writable = _worker;
    _isLocked = false;
  }

  /// Update the writable buffer.
  void work();
}

abstract interface class Copyable<T> {
  T copyWith();
}

abstract interface class CopyableDoubleBuffer<T extends Copyable> {
  CopyableDoubleBuffer(this.readable, this._writable) {
    _worker = this.readable;
  }

  late T _worker;
  T readable;
  T _writable;
  bool _isLocked = false;

  /// Returns the readable buffer.
  T? read() {
    if (_isLocked) {
      return null;
    }
    return readable;
  }

  /// Swap the buffers.
  void swap() {
    _isLocked = true;
    _worker = readable;
    readable = _writable;
    _writable = _worker;
    _isLocked = false;
  }

  /// Update the writable buffer.
  void work();
}

