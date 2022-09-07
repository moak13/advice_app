import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/shared_widgets/info_card.dart';
import '../../../core/utils/size_manager.dart';
import '../view_model/home_viewmodel.dart';
import 'action_button.dart';

class Contents extends ViewModelWidget<HomeViewModel> {
  const Contents({Key? key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    SizeMg.init(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const InfoCard(
          informationText:
              'Tired of the regulars? Us too. Let\'s help you get solid advices that count.',
        ),
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
