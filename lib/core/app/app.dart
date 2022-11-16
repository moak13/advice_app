import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

import '../../features/advice/advice_view.dart';
import '../../features/advices/advices_view.dart';
import '../../features/home/home_view.dart';
import '../../features/splash/splash_view.dart';
import '../services/advice_slip_service.dart';
import '../services/connectivity_service.dart';
import '../services/database_service.dart';
import '../services/internet_connection_service.dart';
import '../services/network_service.dart';
import '../stores/slip_store.dart';

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
    LazySingleton(
      classType: DialogService,
    ),
    LazySingleton(
      classType: DatabaseMigrationService,
    ),
    LazySingleton(
      classType: DatabaseService,
    ),
    LazySingleton(
      classType: SlipStore,
    ),
    LazySingleton(
      classType: DioHttpServiceImpl,
      asType: DioHttpService,
    ),
    LazySingleton(
      classType: InternetConnectionServiceImpl,
      asType: InternetConnectionService,
    ),
    LazySingleton(
      classType: ConnectivityServiceImpl,
      asType: ConnectivityService,
    ),
    LazySingleton(
      classType: AdviceSlipServiceImpl,
      asType: AdviceSlipService,
    ),
    LazySingleton(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    )
  ],
  logger: StackedLogger(),
)
class AppSetup {}
