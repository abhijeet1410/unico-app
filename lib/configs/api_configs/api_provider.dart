import 'package:flutter_template_3/configs/environment.dart';
import 'package:get/get.dart';

import 'api.dart';

///
/// Created by Sunil Kumar
/// On 12-07-2022 04:49 PM
///

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = Environment.baseApiUrl;
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
  }
}
