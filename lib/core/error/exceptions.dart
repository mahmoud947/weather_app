import 'package:flutter/foundation.dart' show immutable;

//? Remote Exception
const Map<int, RemoteException> remoteExceptions = {
  403: APIKeyHasBeenDisabledException(message: 'API key has been disabled')
};

@immutable
abstract class RemoteException implements Exception {
  const RemoteException({required this.message});
  final String message;
}

@immutable
class ServerException extends RemoteException {
  const ServerException({required String message}) : super(message: message);
}

@immutable
class APIKeyHasBeenDisabledException extends RemoteException {
  const APIKeyHasBeenDisabledException({required String message})
      : super(message: message);
}

//* helper function to get network exception direct from status code
RemoteException getExceptionFromStatusCode(int statusCode) {
  return remoteExceptions[statusCode] ??
      const ServerException(message: 'unknown exception');
}

//? platform Exception
abstract class PlatformException implements Exception {
  const PlatformException({required this.message});
  final String message;
}

class NoInternetConnection extends PlatformException {
  const NoInternetConnection()
      : super(message: 'check your internet connection');
}
