///
/// Created by Sunil Kumar from Boiler plate
///

class LoginOTPResponse {
  LoginOTPResponse({
    required this.action,
    this.countryCode,
    this.email,
    this.phone,
    required this.locale,
    required this.timeZoneOffset,
    this.message = "OTP sent successfully",
    this.otp,
  });

  String message;
  String? otp;
  String action;
  String? countryCode;
  String? email;
  String? phone;
  String locale;
  String timeZoneOffset;

  factory LoginOTPResponse.fromJson(Map<String, dynamic> json) =>
      LoginOTPResponse(
          action: json["action"],
          countryCode: json["countryCode"],
          email: json["email"],
          phone: json["phone"],
          locale: json["locale"] ?? "en",
          timeZoneOffset: json["timeZone"] ?? "+5.30",
          message: "OTP sent successfully to ${json["email"] ?? json["phone"]}",
          otp: "000000");

  Map<String, dynamic> toJson() => {
        "action": action,
        "countryCode": countryCode,
        "email": email,
        "phone": phone,
        "locale": locale,
        "timeZone": timeZoneOffset,
        "message": message,
        "otp": otp
      };
}
