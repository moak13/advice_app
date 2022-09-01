import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../app/app.logger.dart';

abstract class InternetConnectionService {
  Future<bool> getConnectionStatus();
}

class InternetConnectionServiceImpl implements InternetConnectionService {
  final log = getLogger('InternetConnectionService');
  InternetConnectionChecker checker = InternetConnectionChecker();
  @override
  Future<bool> getConnectionStatus() async {
    log.i('connection check');
    return checker.hasConnection;
  }
}
