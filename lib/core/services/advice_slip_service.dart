import 'package:dio/dio.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';
import '../models/advice_slip.dart';
import '../utils/config.dart';
import 'network_service.dart';

abstract class AdviceSlipService {
  String get path;
  Future<AdviceSlip> getRandomSlip();
}

class AdviceSlipServiceImpl implements AdviceSlipService {
  final _dioHttpService = locator<DioHttpService>();
  final _log = getLogger('AdviceSlipService');
  @override
  Future<AdviceSlip> getRandomSlip() async {
    _log.i('function called');
    try {
      final response = await _dioHttpService.appGet(
        path,
      );
      return AdviceSlip.fromJson(response);
    } on DioError {
      rethrow;
    }
  }

  @override
  String get path => Configs.path;
}
