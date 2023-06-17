class NotificationRequest {
  NotificationRequest({
    this.limit = 20,
    this.skip = 0,
    this.createdBy = "",
  });

  int limit;
  int skip;
  String createdBy;

  factory NotificationRequest.fromJson(Map<String, dynamic> json) =>
      NotificationRequest(
        limit: json["limit"],
        skip: json["skip"],
        createdBy: json["createdBy"],
      );

  Map<String, String> toQuery() => {
        "limit": limit.toString(),
        "skip": skip.toString(),
        if (createdBy.isNotEmpty) "createdBy": createdBy,
        "\$sort[createdAt]": "-1",
      };
}
