///
/// Created by Sunil Kumar
/// On 05-03-2022 10:20 AM
///
import 'dart:convert';

 import 'package:flutter/material.dart';
import 'package:unico_app/app/core/utils/date_utils/date_utils.dart';
import 'package:intl/intl.dart';

NotificationNetworkResponse notificationResponseFromJson(String str) =>
    NotificationNetworkResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationNetworkResponse data) =>
    json.encode(data.toJson());

class NotificationNetworkResponse {
  NotificationNetworkResponse({
    required this.total,
    required this.limit,
    required this.skip,
    required this.data,
  });

  int total;
  int limit;
  int skip;
  List<NotificationDatum> data;

  factory NotificationNetworkResponse.fromJson(Map<String, dynamic> json) =>
      NotificationNetworkResponse(
        total: json["total"] ?? 0,
        limit: json["limit"] ?? 0,
        skip: json["skip"] ?? 0,
        data: json["data"] == null
            ? []
            : List<NotificationDatum>.from(
                json["data"].map((x) => NotificationDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NotificationDatum {
  NotificationDatum(
      {required this.id,
      this.createdAt,
      this.updatedAt,
      this.description = "",
      this.action = "",
      required this.entityId,
      required this.entityType,
      required this.title});

  String id;
  String title;
  String description;

  String action;

  dynamic entityId;
  String entityType;

  DateTime? createdAt;
  DateTime? updatedAt;

  String get generalizeTime {
    if (createdAt == null) return "";
    if (DateUtils.isSameDay(DateTime.now(), createdAt)) {
      return DateFormat("hh:mm a").format(createdAt!);
    } else {
      return AppDateUtils.formatTimeAgo(createdAt!);
    }
  }

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      NotificationDatum(
          id: json["_id"] ?? "",
          createdAt: json["createdAt"] != null
              ? DateTime.parse(json["createdAt"]).toLocal()
              : null,
          updatedAt: json["updatedAt"] != null
              ? DateTime.parse(json["updatedAt"]).toLocal()
              : null,
          action: json["action"] ?? "",
          entityId: json["entityId"] ?? "",
          entityType: json["entityType"] ?? "",
          title: json["title"] ?? "",
          description: json["description"] ?? "");

  Map<String, String> toJson() => {
        "_id": id,
        if (createdAt != null) "createdAt": createdAt!.toIso8601String(),
        if (updatedAt != null) "updatedAt": updatedAt!.toIso8601String(),
        "entityId": entityId,
        "entityType": entityType,
        "action": action,
        "title": title,
        "description": description,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationDatum &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;
}
