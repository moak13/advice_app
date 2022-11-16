import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/app/app.router.dart';
import '../../../core/enum/snackbar_enum.dart';
import '../../../core/extensions/dio_extension.dart';
import '../../../core/services/advice_slip_service.dart';
import '../../../core/services/connectivity_service.dart';

class HomeViewModel extends StreamViewModel<bool> {
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _adviceSlipService = locator<AdviceSlipService>();
  final _connectivityService = locator<ConnectivityService>();
  final _themeService = locator<ThemeService>();
  final _log = getLogger('HomeViewModel');

  bool get isDark => _themeService.isDarkMode;

  void actionSwitchTheme() {
    _themeService.toggleDarkLightTheme();
  }

  void actionRouteAdvices() {
    _navigationService.navigateToAdvicesView();
  }

  void actionShowNetworkStatus(bool? value) {
    _log.i('status: $value');
    if (value == false) {
      return _handleSnackbar(
        message: 'Inactive',
        title: 'Connection Status',
        variant: SnackBarType.error,
      );
    }
    return _handleSnackbar(
      message: 'Active',
      title: 'Connection Status',
      variant: SnackBarType.success,
    );
  }

  void actionGetAdviceSlip() async {
    _log.i('fetching advice');
    setBusy(true);
    try {
      final adviceSlip = await _adviceSlipService.getRandomSlip();
      setBusy(false);
      if (adviceSlip.slip == null) {
        return;
      }
      _navigationService.navigateToAdviceView(
        slip: adviceSlip.slip,
      );
    } on DioError catch (e) {
      _log.i(
          'error in fetching advice from backend. StatusCode: ${e.response?.statusCode}');
      setBusy(false);
      _handleSnackbar(
        title: 'Error!',
        message: '${e.errorMessage}',
        variant: SnackBarType.error,
      );
    } catch (e) {
      _log.i('error in fetching advice from backend ${e.toString()}');
      setBusy(false);
      _handleSnackbar(
        title: 'Error!',
        message: e.toString(),
        variant: SnackBarType.error,
      );
    } finally {
      setBusy(false);
    }
  }

  void _handleSnackbar({
    String? title,
    required String message,
    dynamic variant,
  }) {
    _snackbarService.showCustomSnackBar(
      title: title,
      message: message,
      variant: variant,
    );
  }

  @override
  Stream<bool> get stream => _connectivityService.connectionStatus;

  @override
  void dispose() {
    _connectivityService.disposeStream();
    super.dispose();
  }
}
