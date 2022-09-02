// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:sqflite_migration_service/sqflite_migration_service.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/advice_slip_service.dart';
import '../services/connectivity_service.dart';
import '../services/database_service.dart';
import '../services/internet_connection_service.dart';
import '../services/network_service.dart';
import '../stores/slip_store.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DatabaseMigrationService());
  locator.registerLazySingleton(() => DatabaseService());
  locator.registerLazySingleton(() => SlipStore());
  locator.registerLazySingleton<DioHttpService>(() => DioHttpServiceImpl());
  locator.registerLazySingleton<InternetConnectionService>(
      () => InternetConnectionServiceImpl());
  locator.registerLazySingleton<ConnectivityService>(
      () => ConnectivityServiceImpl());
  locator
      .registerLazySingleton<AdviceSlipService>(() => AdviceSlipServiceImpl());
}
