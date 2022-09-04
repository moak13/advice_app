import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/utils/size_manager.dart';
import 'view_model/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) {
        model.actionHandleStartUp();
      },
      viewModelBuilder: () => SplashViewModel(),
      builder: (
        BuildContext context,
        SplashViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Center(
            child: Text(
              'Advice Slip App',
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: SizeMg.text(30),
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey,
              ),
            ),
          ),
        );
      },
    );
  }
}
