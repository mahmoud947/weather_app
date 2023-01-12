abstract class DataState<T> {}

class Successfully<T> implements DataState<T> {
  Successfully({required this.data});
  final T data;
}

class Loading<T> implements DataState<T> {}

class Error<T> implements DataState<T> {
  const Error({required this.message});
  final String message;
}
