///
/// Created by Sunil Kumar
/// On 12-07-2022 05:19 PM
///
///
/// Created by Sunil Kumar
/// On 20-02-2022 11:23 PM
///
// To parse this JSON data, do
//
//     final state = stateFromJson(jsonString);

import 'dart:convert';

List<City> cityFromJson(String str) =>
    List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

String cityToJson(List<City> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class City {
  City(
      {required this.id,
      required this.name,
      required this.country,
      required this.state});

  String id;
  String name;
  String country;
  String state;
  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        country: json["country"] ?? "",
        state: json["state"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "country": country,
        "state": state,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
