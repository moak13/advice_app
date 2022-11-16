import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/slip.dart';
import '../../core/utils/size_manager.dart';
import '../../core/shared_widgets/info_card.dart';
import 'view_model/advice_viewmodel.dart';

class AdviceView extends StatelessWidget {
  final Slip? slip;
  const AdviceView({
    Key? key,
    this.slip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<AdviceViewModel>.reactive(
      viewModelBuilder: () => AdviceViewModel(),
      builder: (
        BuildContext context,
        AdviceViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: theme.appBarTheme.backgroundColor,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const InfoCard(
                  informationText:
                      'Make use of the icon below to save an advice that speaks most to you.',
                ),
                SizedBox(
                  height: SizeMg.height(100),
                ),
                Container(
                  height: SizeMg.height(100),
                  width: SizeMg.width(100),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: FittedBox(
                    child: Text(
                      '${slip?.id}',
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontSize: SizeMg.text(40),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(30),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeMg.width(20),
                    right: SizeMg.width(20),
                  ),
                  child: Text(
                    '${slip?.advice}',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Save Advice',
            onPressed: () {
              model.actionconfirmSave(slip: slip);
            },
            child: const Icon(Icons.save),
          ),
        );
      },
    );
  }
}
