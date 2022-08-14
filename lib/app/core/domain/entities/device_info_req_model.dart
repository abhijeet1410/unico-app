class DeviceInfoReqModel {
  final String? deviceId,
      deviceManufacturer,
      deviceOsVersion,
      deviceType,
      deviceTimeZone,
      deviceToken,
      appVersion,
      deviceBrand;

  DeviceInfoReqModel(
      this.deviceId,
      this.deviceManufacturer,
      this.deviceOsVersion,
      this.deviceType,
      this.deviceTimeZone,
      this.deviceToken,
      this.appVersion,
      this.deviceBrand);

  Map<String, dynamic> toJson() => {
        'deviceId': deviceId,
        'deviceManufacturer': deviceManufacturer,
        'deviceOSVersion': deviceOsVersion,
        'deviceTimezone': deviceTimeZone,
        'deviceToken': deviceToken,
        'deviceType': deviceType
      };
}
