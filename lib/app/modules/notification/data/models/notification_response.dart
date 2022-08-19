///
/// Created by Sunil Kumar
/// On 05-03-2022 10:20 AM
///
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/common_functions.dart';
import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:intl/intl.dart';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

class NotificationResponse {
  NotificationResponse({
    required this.total,
    required this.limit,
    required this.skip,
    required this.data,
  });

  int total;
  int limit;
  int skip;
  List<NotificationDatum> data;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
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
      this.user,
      this.createdBy,
      required this.action,
      required this.status,
      this.createdAt,
      this.updatedAt,
      required this.entityId,
      required this.entityType,
      required this.title,
      this.parentEntityId,
      required this.parentEntityType,
      required this.message,
      this.link = ""});

  String id;
  String title;
  User? createdBy;
  User? user;
  String action;

  String parentEntityType;
  dynamic parentEntityId;

  dynamic entityId;
  String entityType;

  String status;
  DateTime? createdAt;
  DateTime? updatedAt;

  String message;
  String link;
  String get generalizeTime {
    if (createdAt == null) return "";
    if (DateUtils.isSameDay(DateTime.now(), createdAt)) {
      return DateFormat("hh:mm a").format(createdAt!);
    } else {
      return formatTimeAgo(createdAt!);
    }
  }

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      NotificationDatum(
        id: json["_id"] ?? "",
        createdBy: json["createdBy"] == null
            ? null
            : json["createdBy"] is Map
                ? User.fromJson(json["createdBy"])
                : User.fromJson({"_id": json["createdBy"]}),
        user: json["user"] == null
            ? null
            : json["user"] is Map
                ? User.fromJson(json["user"])
                : User.fromJson({"_id": json["user"]}),
        status: (json["status"] ?? 1).toString(),
        action: json["action"] ?? "",
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"]).toLocal()
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"]).toLocal()
            : null,
        entityId: json["entityId"] ?? "",
        entityType: json["entityType"] ?? "",
        title: json["title"] ?? "",
        message: json["message"] ?? "",
        parentEntityType: json["parentEntityType"] ?? "",
        parentEntityId: json["parentEntityId"] ?? "",
        link: json["link"] ?? "",
      );

  Map<String, String> toJson() => {
        "_id": id,
        if (user != null) "user": user!.id,
        if (createdBy != null) "createdBy": createdBy!.id,
        "action": action,
        "status": status,
        if (createdAt != null) "createdAt": createdAt!.toIso8601String(),
        if (updatedAt != null) "updatedAt": updatedAt!.toIso8601String(),
        "entityId": entityId,
        "entityType": entityType,
        "title": title,
        "message": message,
        "parentEntityType": parentEntityType,
        "parentEntityId": parentEntityId,
        "link": link
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
