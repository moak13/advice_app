import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/app/app.router.dart';
import '../../../core/services/database_service.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('SplashViewModel');

  void _actionRouteWrapperView() {
    _log.i('routing invoked');
    _navigationService.clearStackAndShow(Routes.homeView);
  }

  Future _initialise() async {
    _log.i('database invoked from splash view');
    await _databaseService.initialise();
    _actionRouteWrapperView();
  }

  void actionHandleStartUp() async {
    _log.i('starting up');
    const duration = Duration(seconds: 3);
    Timer(duration, _initialise);
  }
}
