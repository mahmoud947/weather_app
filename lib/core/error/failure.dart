abstract class Failure {
  Failure({required this.message});
  String message;
}

class PlatformFailure extends Failure {
  PlatformFailure({required super.message});
}

class RemoteFailure extends Failure {
  RemoteFailure({required super.message});
}
