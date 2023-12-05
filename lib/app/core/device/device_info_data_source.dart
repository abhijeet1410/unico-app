import 'package:unico_app/app/core/models/device_info_req_model.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

abstract class DeviceInfoDataSource {
  Future<DeviceInfoReqModel?> getDeviceInfo();
}
