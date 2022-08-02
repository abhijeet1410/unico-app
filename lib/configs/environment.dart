///
/// Created by Sunil Kumar from Boiler plate.
///
mixin Environment {
  static const String environment =
      String.fromEnvironment("env", defaultValue: 'dev');

  static const String baseApiUrl = environment == 'prod'
      ? 'https://api.ruchi.smarttersstudio.in'
      : 'https://api.ruchi.smarttersstudio.in';

  static const bool useMockData = false;
}
