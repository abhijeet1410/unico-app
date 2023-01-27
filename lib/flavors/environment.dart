import 'package:logger/logger.dart';

///
/// Created by Sunil Kumar from Boiler plate.
///
enum Environment { development, production }

class AppDevLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

class AppProdLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
