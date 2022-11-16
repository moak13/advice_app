import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'core/app/app.locator.dart';
import 'core/app/app.router.dart';
import 'core/utils/setup_snackbar_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await setupLocator();
  await ThemeManager.initialise();
  setupSnackbarUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      lightTheme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      builder: (context, lightTheme, darkTheme, themeMode) {
        return MaterialApp(
          title: 'Advice App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          navigatorKey: StackedService.navigatorKey,
          initialRoute: Routes.splashView,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorObservers: [StackedService.routeObserver],
        );
      },
    );
  }
}
