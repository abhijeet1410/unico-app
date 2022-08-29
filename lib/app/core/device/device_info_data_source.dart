import 'package:flutter_template_3/app/core/data/models/device_info_req_model.dart';

abstract class DeviceInfoDataSource {
  Future<DeviceInfoReqModel?> getDeviceInfo();
}
