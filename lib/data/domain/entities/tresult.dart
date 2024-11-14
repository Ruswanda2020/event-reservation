sealed class TResult<T> {
  bool get isSuccess => this is Success<T>;
  Success<T> get asSuccess => this as Success<T>;
  Failure<T> get asFailure => this as Failure<T>;
}

class Success<T> extends TResult<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends TResult<T> {
  final String message;
  Failure(this.message);
}
