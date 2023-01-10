import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfoHelper {
  Future<bool> get isConnected;
}

class NetworkConnectionInfoImpl implements NetworkInfoHelper {
  NetworkConnectionInfoImpl();

  @override
  Future<bool> get isConnected async {
    final connection = await Connectivity().checkConnectivity();
    if (connection != ConnectivityResult.none) {
      return true;
    } else {
      return false;
    }
  }
}
