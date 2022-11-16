import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/enum/snackbar_enum.dart';
import '../../../core/models/slip.dart';
import '../../../core/stores/slip_store.dart';

class AdviceViewModel extends BaseViewModel {
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();
  final _slipStore = locator<SlipStore>();
  final _log = getLogger('AdviceViewModel');

  void _actionSaveAdvice({Slip? slip}) async {
    try {
      _log.i('adding advice');
      if (await _slipStore.isSaved(slipId: slip?.id)) {
        return _handleSnackbar(
          title: 'Error',
          message: 'An advice with the ID: ${slip?.id} has already been saved.',
          variant: SnackBarType.error,
        );
      }
      await _slipStore.addAdvice(slip: slip);
      return _handleSnackbar(
        title: 'Info',
        message: 'An advice with an ID: ${slip?.id} has been saved.',
        variant: SnackBarType.info,
      );
    } catch (e) {
      _log.e('well once in awhile, things do break.');
      return _handleSnackbar(
        title: 'Error',
        message: 'Opps! something went wrong',
        variant: SnackBarType.error,
      );
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

  void actionconfirmSave({Slip? slip}) async {
    final DialogResponse? response = await _dialogService.showDialog(
      title: 'Save Advice',
      description: 'Are you sure you want to save this advice?',
      buttonTitle: 'Yes',
      cancelTitle: 'No',
    );
    if (response?.confirmed ?? false) {
      _actionSaveAdvice(slip: slip);
    }
  }
}
