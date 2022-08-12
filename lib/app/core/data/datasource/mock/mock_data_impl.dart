import 'dart:convert';

import 'package:flutter/services.dart';

const String basePath = "assets/mock_json";
const String SPLASH_API = "$basePath/splash.json";
const String GET_ACTIVATE_DEVICE_DATA_API =
    "$basePath/get_activate_device_data.json";
const String VALIDATE_SERIAL_NUMBER_API =
    "$basePath/validate_serial_number.json";
const String VALIDATE_PACKAGE_ID_API = "$basePath/validate_package_id.json";
const String PAYMENT_METHODS_API = "$basePath/payment_methods.json";
const String REGISTER_API = "$basePath/register.json";
const String GET_SIGN_UP_DATA_API = "$basePath/get_sign_up_data.json";
const String LOGIN_DATA_API = "$basePath/login.json";
const String SIGN_UP_DATA_API = "$basePath/sign_up.json";
const String UPDATE_PROFILE = "$basePath/update_profile.json";
const String PAYMENT_CHECKOUT = "$basePath/payment_checkout.json";
const String DASHBOARD = "$basePath/dashboard.json";
const String PAYMENT_CENTER = "$basePath/payment_center.json";
const String LOGOUT = "$basePath/logout.json";
const String PAYMENT_ACTIVITY = "$basePath/payment_activity.json";
const String PAYMENT_ACTIVITY2 = "$basePath/payment_activity_page_2.json";
const String DOWNLOAD_PAYMENT_ACTIVITY_PDF =
    "$basePath/download_payment_activity_pdf.json";
const String BILL_DETAIL = "$basePath/bill_detail.json";
const String BILL_DETAIL_PDF = "$basePath/bill_detail_pdf.json";
const String PAYMENT_METHOD = "$basePath/payment_method.json";
const String ADD_EDIT_PAYMENT_METHOD = "$basePath/add_edit_payment_method.json";
const String SAVE_AUTO_PAY_PAYMENT =
    "$basePath/save_auto_pay_payment_method.json";
const String GET_MANAGE_AUTO_PAY_MOCK_API =
    "$basePath/get_manage_auto_pay.json";
const String GET_MY_PLAN_DETAIL = "$basePath/get_my_plan_detail.json";
const String CHANGE_PLAN = "$basePath/change_plan.json";
const String GET_MANAGE_ADD_ONS = "$basePath/manage_add_ons.json";
const String SAVE_ADDONS_MOCK_API = "$basePath/save_addons_response.json";
const String CANCEL_SERVICE_MOCK_API = "$basePath/get_cancel_service.json";
const String PAUSE_SERVICE_MOCK_API = "$basePath/get_pause_data.json";
const String GET_PAY_DUE_BILL_DETAIL_API =
    "$basePath/get_pay_due_bill_detail.json";
const String GET_PLAN_AND_ADD_ONS_BY_COUNTRY_ID =
    "$basePath/get_plan_and_add_ons_by_country_id.json";

const String MY_PLANS = "$basePath/my_plans.json";
const String MANAGE_PLANS_CONFIGURATION =
    "$basePath/get_manage_plan_configuration.json";

///Map
const String GET_VEHICLE_WITH_LOCATION =
    "$basePath/get_vehicle_with_location.json";
const String GET_FILTERED_VEHICLE_DATA =
    "$basePath/get_filtered_vehicles_data.json";
const String GET_VEHICLE_DETAIL_MAP = "$basePath/get_vehicles_detail_map.json";

mixin MockDataImpl {
  Future<Map<String, dynamic>> loadFromAssetData(String _path) async =>
      jsonDecode(await rootBundle.loadString(_path));
}
