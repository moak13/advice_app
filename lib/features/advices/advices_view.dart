import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/advices_viewmodel.dart';

class AdvicesView extends StatelessWidget {
  const AdvicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdvicesViewModel>.reactive(
      viewModelBuilder: () => AdvicesViewModel(),
      builder: (
        BuildContext context,
        AdvicesViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'Advices View',
            ),
          ),
        );
      },
    );
  }
}
