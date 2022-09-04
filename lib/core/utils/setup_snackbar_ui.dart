import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../enum/snackbar_enum.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.success,
    config: SnackbarConfig(
      backgroundColor: Colors.green,
      titleColor: Colors.black,
      messageColor: Colors.white,
      borderRadius: 1,
      snackPosition: SnackPosition.TOP,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.error,
    config: SnackbarConfig(
      backgroundColor: Colors.red,
      titleColor: Colors.black,
      messageColor: Colors.white,
      borderRadius: 1,
      snackPosition: SnackPosition.TOP,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackBarType.info,
    config: SnackbarConfig(
      backgroundColor: Colors.blue,
      titleColor: Colors.black,
      messageColor: Colors.white,
      borderRadius: 1,
      snackPosition: SnackPosition.TOP,
    ),
  );
}
