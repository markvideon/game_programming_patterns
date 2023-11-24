/// The Service Locator pattern involves providing an abstraction over various
/// services used in your application, which can be really useful for mocking
/// behaviour during tests.
///
/// The implementation  might look something like:
///
/// class Locator implements Singleton {
///   LogService get loggingService => _loggingService;
///   late LogService _loggingService;
///
///   void setLogger(LogService candidate) {
///     _loggingService = candidate;
///   }
/// }
///
/// An implementation should be application specific.
/// https://gameprogrammingpatterns.com/service-locator.html