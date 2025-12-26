import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkChecker {
  static Future<bool> get isConnected async {
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  static Stream<bool> get onStatusChange => Connectivity().onConnectivityChanged
      .map((event) => event != ConnectivityResult.none);
}
