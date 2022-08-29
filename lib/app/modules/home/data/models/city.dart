///
/// Created by Sunil Kumar from Boiler plate
///

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
