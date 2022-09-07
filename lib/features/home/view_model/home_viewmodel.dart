import 'package:dio/dio.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/app/app.router.dart';
import '../../../core/enum/snackbar_enum.dart';
import '../../../core/extensions/dio_extension.dart';
import '../../../core/services/advice_slip_service.dart';

class HomeViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _navigationService = locator<NavigationService>();
  final _adviceSlipService = locator<AdviceSlipService>();
  final _log = getLogger('HomeViewModel');

  void actionRouteAdvices() {
    _navigationService.navigateToAdvicesView();
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
}
