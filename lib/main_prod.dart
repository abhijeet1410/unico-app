import 'package:flutter_template_3/app/my_app.dart';
import 'package:flutter_template_3/flavors/build_config.dart';
import 'package:flutter_template_3/flavors/env_config.dart';
import 'package:flutter_template_3/flavors/environment.dart';

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
