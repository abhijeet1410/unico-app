import 'package:flutter_template_3/app/core/values/app_values.dart';
import 'package:logger/logger.dart';

///
/// Created by Sunil Kumar
/// On 03-08-2022 06:03 PM
///

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool useMockData;
  final bool allowAutoSignedCert;
  late final Logger logger;
  late final String? googleClientId;

  EnvConfig(
      {required this.appName,
      required this.baseUrl,
      required this.useMockData,
      this.allowAutoSignedCert = false,
      this.googleClientId}) {
    logger = Logger(
      printer: PrettyPrinter(
          methodCount: AppValues.loggerMethodCount,
          // number of method calls to be displayed
          errorMethodCount: AppValues.loggerErrorMethodCount,
          // number of method calls if stacktrace is provided
          lineLength: AppValues.loggerLineLength,
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
