/// An application using a component system could have many different
/// kinds of components.
///
/// Components are usually attached to some kind of base object, such as the
/// GameObject in the Unity Engine.
///
/// https://gameprogrammingpatterns.com/component.html
abstract class GameObject {
  List<Component> components = [];

  T addComponent<T extends Component>();

  bool removeComponent(Component candidate) {
    return components.remove(candidate);
  }
}

abstract class Component {}