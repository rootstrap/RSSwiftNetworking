/// Defines a cancellable work.
public protocol Cancellable {
  func cancel() -> Self
}
