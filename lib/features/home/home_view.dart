import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/utils/size_manager.dart';
import 'view_model/home_viewmodel.dart';
import 'widgets/contents.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    SizeMg.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) {
        model.stream.listen((event) {
          model.actionShowNetworkStatus(event);
        });
      },
      viewModelBuilder: () => HomeViewModel(),
      builder: (
        BuildContext context,
        HomeViewModel model,
        Widget? child,
      ) {
        List<Widget> children = [const Contents()];
        if (model.isBusy) {
          children.add(
            const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Switch.adaptive(
              value: model.isDark,
              onChanged: (value) {
                model.actionSwitchTheme();
              },
            ),
            actions: [
              IconButton(
                color: theme.iconTheme.color,
                onPressed: () {
                  model.actionRouteAdvices();
                },
                icon: const Icon(Icons.list_alt_outlined),
              ),
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: children,
            ),
          ),
        );
      },
    );
  }
}
