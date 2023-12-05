import 'package:unico_app/flavors/environment.dart';
import 'package:logger/logger.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool useMockData;
  final bool allowAutoSignedCert;
  late final Logger logger;
  late final String? googleClientId;
  late LogFilter? appLogFilter;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.useMockData,
    this.allowAutoSignedCert = false,
    this.googleClientId,
    LogFilter? logFilter,
  }) {
    appLogFilter = logFilter ?? AppProdLogFilter();

    logger = Logger(
      filter: appLogFilter,
      printer: PrettyPrinter(
          methodCount: 1,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
  }
}
