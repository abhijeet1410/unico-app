import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/my_app.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:flutter_template_3/flavors/env_config.dart';
import 'package:flutter_template_3/flavors/environment.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
void main() {
  EnvConfig devConfig = EnvConfig(
      appName: "Flutter Template Dev",
      baseUrl: "https://api.ausicare.smarttersstudio.com",
      useMockData: true,
      allowAutoSignedCert: true);

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  mainDelegate();
}
