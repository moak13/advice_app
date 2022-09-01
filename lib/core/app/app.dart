import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../features/advice/advice_view.dart';
import '../../features/advices/advices_view.dart';
import '../../features/home/home_view.dart';
import '../../features/splash/splash_view.dart';

@StackedApp(
  routes: [
    AdaptiveRoute(
      page: SplashView,
      initial: true,
    ),
    AdaptiveRoute(
      page: HomeView,
    ),
    AdaptiveRoute(
      page: AdviceView,
    ),
    AdaptiveRoute(
      page: AdvicesView,
    ),
  ],
  dependencies: [
    LazySingleton(
      classType: NavigationService,
    ),
    LazySingleton(
      classType: SnackbarService,
    ),
  ],
  logger: StackedLogger(),
)
class AppSetup {}