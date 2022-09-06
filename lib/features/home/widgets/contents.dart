import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/utils/size_manager.dart';
import '../view_model/home_viewmodel.dart';
import 'action_button.dart';
import 'info_card.dart';

class Contents extends ViewModelWidget<HomeViewModel> {
  const Contents({Key? key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    SizeMg.init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const InfoCard(),
        SizedBox(
          height: SizeMg.height(50),
        ),
        ActionButton(
          onTap: () {
            viewModel.actionGetAdviceSlip();
          },
        ),
      ],
    );
  }
}
