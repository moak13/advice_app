import 'package:sqflite/sqflite.dart';
import 'package:sqflite_migration_service/sqflite_migration_service.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';

const String dbName = 'movie_database.sqlite';

class DatabaseService {
  final _log = getLogger('DatabaseService');
  final _migrationService = locator<DatabaseMigrationService>();

  Database? _database;
  Database? get database => _database;

  Future initialise() async {
    _log.i('database initialize');
    _database = await openDatabase(dbName, version: 1);

    // Apply migration on every start
    await _migrationService.runMigration(
      _database,
      migrationFiles: [
        '1_create_schema.sql',
      ],
      verbose: true,
    );
  }
}
