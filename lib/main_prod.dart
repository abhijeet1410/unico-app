import 'package:unico_app/app/my_app.dart';
import 'package:unico_app/flavors/build_config.dart';
import 'package:unico_app/flavors/env_config.dart';
import 'package:unico_app/flavors/environment.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
void main() {
  EnvConfig devConfig = EnvConfig(
      appName: "Flutter Template Prod",
      baseUrl: "https://api.test.kemnu.com",
      useMockData: false,
      logFilter: AppProdLogFilter(),
      allowAutoSignedCert: false);

  BuildConfig.instantiate(
    envType: Environment.production,
    envConfig: devConfig,
  );

  mainDelegate();
}
