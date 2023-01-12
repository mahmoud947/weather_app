// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../error/failure.dart';

abstract class UseCaseState<T> {}

class Right<T> implements UseCaseState<T> {
  Right({required this.data});
  final T data;
}

class Left<T> implements UseCaseState<T> {
  Left({required this.failure});
  Failure failure;
}
