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
    useMockData: false,
    allowAutoSignedCert: true,
    logFilter: AppDevLogFilter(),
  );

  BuildConfig.instantiate(
    envType: Environment.development,
    envConfig: devConfig,
  );
  mainDelegate();
}
