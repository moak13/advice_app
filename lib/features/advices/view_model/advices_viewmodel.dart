import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/app/app.locator.dart';
import '../../../core/app/app.logger.dart';
import '../../../core/enum/snackbar_enum.dart';
import '../../../core/models/slip.dart';
import '../../../core/stores/slip_store.dart';

class AdvicesViewModel extends StreamViewModel<List<Slip>> {
  final _slipStore = locator<SlipStore>();
  final _snackbarService = locator<SnackbarService>();
  final _dialogService = locator<DialogService>();
  final _log = getLogger('AdvicesViewModel');

  void _actionDeleteAdvice({Slip? slip}) async {
    _log.i('deleting advice');
    await _slipStore.removeAdvice(slip: slip);
    _snackbarService.showCustomSnackBar(
      title: 'Info',
      message: 'An advice with the ID: ${slip?.id} has been deleted.',
      variant: SnackBarType.info,
    );
    // This helps to refresh the ViewModel once the contract is called.
    initialise();
  }

  void actionconfirmDelete({Slip? slip}) async {
    final DialogResponse? response = await _dialogService.showDialog(
      title: 'Delete Advice',
      description: 'Are you sure you want to delete this advice?',
      buttonTitle: 'Yes',
      cancelTitle: 'No',
    );
    if (response?.confirmed ?? false) {
      _actionDeleteAdvice(slip: slip);
    }
  }

  @override
  Stream<List<Slip>> get stream => _slipStore.getStreamAdvice();
}
