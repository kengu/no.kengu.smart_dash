/// Generic Error callback function
typedef ErrorCallback = void Function(
  Object error,
  StackTrace stackTrace,
);

typedef ValueBuilder<S, T> = S Function(T data);
