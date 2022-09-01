import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/slip.dart';
import 'view_model/advice_viewmodel.dart';

class AdviceView extends StatelessWidget {
  final Slip? slip;
  const AdviceView({
    Key? key,
    this.slip,
  }) : super(key: key);

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
