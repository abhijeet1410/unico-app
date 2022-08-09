import 'package:flutter_template_3/flavors/env_config.dart';
import 'package:flutter_template_3/flavors/environment.dart';

///
/// Created by Sunil Kumar
/// On 03-08-2022 06:03 PM
///

class BuildConfig {
  late final Environment environment;
  late final EnvConfig config;
  bool _lock = false;

  static final BuildConfig instance = BuildConfig._internal();

  BuildConfig._internal();

  factory BuildConfig.instantiate({
    required Environment envType,
    required EnvConfig envConfig,
  }) {
    if (instance._lock) return instance;

    instance.environment = envType;
    instance.config = envConfig;
    instance._lock = true;

    return instance;
  }
}
