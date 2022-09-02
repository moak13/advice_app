import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/slip.dart';
import '../services/database_service.dart';

const String _slipTable = 'slip';

class SlipStore {
  final _databaseService = locator<DatabaseService>();
  final _log = getLogger('SlipStore');

  Stream<List<Slip>> getStreamMovies() async* {
    _log.i('streaming slips');
    List<Map<String, dynamic>> slipResults =
        await _databaseService.database!.query(_slipTable);
    yield slipResults.map((e) => Slip.fromJson(e)).toList();
  }

  Future<void> addMovie({Slip? slip}) async {
    _log.i('adding slip: ${slip?.slipId}');
    await _databaseService.database!.insert(_slipTable, slip!.toJson());
  }

  Future<void> removeMovie({Slip? slip}) async {
    _log.i('removing slip: ${slip?.slipId}');
    await _databaseService.database!
        .delete(_slipTable, where: "Title = ?", whereArgs: [slip?.slipId]);
  }

  Future<bool> isSaved({String? slipId}) async {
    _log.i('checking saved state for $slipId');
    bool status = false;
    var records = await _databaseService.database!.query(
      _slipTable,
      where: "slip_id = ?",
      whereArgs: [slipId],
    );
    var data = records.map((e) => Slip.fromJson(e)).toList();
    if (data.isEmpty) {
      status = false;
      _log.i('status: $status');
    } else {
      status = true;
      _log.i('status: $status');
    }
    return status;
  }

  Stream<bool> isStreamedSaved({String? slipId}) async* {
    _log.i('checking saved stream state for $slipId');
    bool status = false;
    var records = await _databaseService.database!.query(
      _slipTable,
      where: "slip_id = ?",
      whereArgs: [slipId],
    );
    var data = records.map((e) => Slip.fromJson(e)).toList();
    if (data.isEmpty) {
      status = false;
      _log.i('status: $status');
    } else {
      status = true;
      _log.i('status: $status');
    }
    yield status;
  }
}
