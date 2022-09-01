import 'package:flutter_template_3/app/core/models/device_info_req_model.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class DeviceInfoDataSource {
  Future<DeviceInfoReqModel?> getDeviceInfo();
}
