/// An abstraction that controls when the client attempts to reconnect and how many attempts to do so.
abstract class RetryPolicy {
  /// Called after the transport loses the connection.
  int? nextRetryDelayInMilliseconds(RetryContext retryContext);
}

class RetryContext {
  const RetryContext({
    required this.previousRetryCount,
    required this.elapsedMilliseconds,
    required this.retryReason,
  });

  /// The number of consecutive failed tries so far.
  final int previousRetryCount;

  /// The amount of time in milliseconds spent retrying so far.
  final int elapsedMilliseconds;

  /// The error that forced the upcoming retry.
  final Exception retryReason;
}
