import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import 'internet_connection_service.dart';

abstract class ConnectivityService {
  Stream<bool> get connectionStatus;
  void disposeStream();
}

class ConnectivityServiceImpl implements ConnectivityService {
  Connectivity connectivity = Connectivity();
  StreamController<bool> connectionChangeController =
      StreamController.broadcast();
  final _internetConnectionService = locator<InternetConnectionService>();
  final _log = getLogger('ConnectivityServiceImpl');
  ConnectivityServiceImpl() {
    checkNetworkAvailability();
  }
  @override
  Stream<bool> get connectionStatus => connectionChangeController.stream;

  Future<bool> checkNetworkAvailability() async {
    _log.i('service triggered');
    bool hasConnection = false;
    connectivity.onConnectivityChanged
        .listen((ConnectivityResult result) async {
      hasConnection = await _internetConnectionService.getConnectionStatus();
      _log.i('hasConnection: $hasConnection');
      connectionChangeController.add(hasConnection);
    });
    return hasConnection;
  }

  @override
  void disposeStream() async {
    await connectionChangeController.close();
  }
}
