import 'package:unico_app/app/my_app.dart';
import 'package:unico_app/flavors/build_config.dart';
import 'package:unico_app/flavors/env_config.dart';
import 'package:unico_app/flavors/environment.dart';

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
