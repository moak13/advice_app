import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/advice_viewmodel.dart';

class AdviceView extends StatelessWidget {
  const AdviceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdviceViewModel>.reactive(
      viewModelBuilder: () => AdviceViewModel(),
      builder: (
        BuildContext context,
        AdviceViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Advice View',
            ),
          ),
        );
      },
    );
  }
}
