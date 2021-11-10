import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:trove/utils/enums.dart';

class ConnectivityService {
  // Flags to keep track of connection state.
  var hasConnection = false;
  ConnectivityStatus networkStatus = ConnectivityStatus.offline;

  // Create our public controller
  // Allow subscription to connection changes.
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  final Connectivity _connectivity = Connectivity();

  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  Stream<ConnectivityStatus> get connectionChange =>
      connectionStatusController.stream;

  // Function that does the actual connection tests.
  Future<bool> checkConnection() async {
    var prevStatus = networkStatus;

    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
        networkStatus = ConnectivityStatus.online;
      } else {
        hasConnection = false;
        networkStatus = ConnectivityStatus.offline;
      }
    } on SocketException catch (_) {
      hasConnection = false;
      networkStatus = ConnectivityStatus.offline;
    }

    // Status change sends out an update to all listeners.
    if (prevStatus != networkStatus) {
      connectionStatusController.add(networkStatus);
      onChange();
    }

    return hasConnection;
  }

  // Helper method to listen to continuous changes after initialization
  void onChange() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
  }

  void dispose() {
    connectionStatusController.close();
  }
}
