import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core/models/slip.dart';
import '../../core/utils/size_manager.dart';
import 'view_model/advices_viewmodel.dart';

class AdvicesView extends StatelessWidget {
  const AdvicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    var theme = Theme.of(context);
    return ViewModelBuilder<AdvicesViewModel>.reactive(
      viewModelBuilder: () => AdvicesViewModel(),
      builder: (
        BuildContext context,
        AdvicesViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            elevation: 0,
          ),
          body: Builder(
            builder: (context) {
              if (model.data?.isEmpty == true && model.dataReady) {
                return Center(
                  child: Text(
                    'No Advice(s) saved.',
                    style: theme.textTheme.bodyLarge,
                  ),
                );
              }
              return ListView.separated(
                itemCount: model.data?.length ?? 0,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: SizeMg.height(10),
                  );
                },
                padding: EdgeInsets.only(
                  top: SizeMg.height(10),
                  left: SizeMg.width(10),
                  right: SizeMg.width(10),
                ),
                itemBuilder: (BuildContext context, int index) {
                  Slip? slip = model.data?.elementAt(index);
                  return ListTile(
                    tileColor: Colors.deepPurpleAccent,
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Text(
                        '${slip?.id}',
                        style: theme.textTheme.caption?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(
                      '${slip?.advice}',
                      style: theme.textTheme.bodyText1,
                    ),
                    trailing: IconButton(
                      color: Colors.redAccent,
                      onPressed: () {
                        model.actionconfirmDelete(slip: slip);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
