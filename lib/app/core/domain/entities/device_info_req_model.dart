class DeviceInfoReqModel {
  final String? deviceId,
      deviceManufacturer,
      deviceOsVersion,
      deviceType,
      platform,
      deviceTimeZone,
      deviceLocale,
      deviceToken,
      appVersion,
      deviceBrand;

  DeviceInfoReqModel(
      {required this.deviceId,
      required this.deviceType,
      this.deviceTimeZone,
      this.deviceLocale,
      this.deviceManufacturer,
      this.deviceOsVersion,
      this.platform,
      this.deviceToken,
      this.appVersion,
      this.deviceBrand});

  Map<String, dynamic> toJson() => {
        'deviceId': deviceId,
        'deviceManufacturer': deviceManufacturer,
        'deviceOSVersion': deviceOsVersion,
        'deviceTimezone': deviceTimeZone,
        'fcmId': deviceToken,
        'deviceType': deviceType,
        'platform': platform,
        'deviceBrand': deviceBrand,
        'deviceLocale': deviceLocale
      };
}
