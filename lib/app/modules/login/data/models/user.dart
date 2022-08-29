import 'dart:convert';

///
/// Created by Sunil Kumar from Boiler plate
///

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.accessToken,
    this.user,
  });

  String? accessToken;
  User? user;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        accessToken: json["accessToken"],
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "user": user?.toJson(),
      };
}

StoreListResponse storeListResponseFromJson(String str) =>
    StoreListResponse.fromJson(json.decode(str));

String storeListResponseToJson(StoreListResponse data) =>
    json.encode(data.toJson());

class StoreListResponse {
  StoreListResponse({
    required this.total,
    required this.limit,
    required this.skip,
    required this.data,
  });

  int total;
  int limit;
  int skip;
  List<User> data;

  factory StoreListResponse.fromJson(Map<String, dynamic> json) =>
      StoreListResponse(
        total: json["total"] ?? 0,
        limit: json["limit"] ?? 0,
        skip: json["skip"] ?? 0,
        data: json["data"] == null
            ? []
            : List<User>.from(json["data"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "skip": skip,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class User {
  User(
      {required this.id,
      required this.name,
      required this.role,
      required this.status,
      this.createdAt,
      this.updatedAt,
      this.dob,
      this.email,
      this.avatar,
      required this.bio,
      required this.phone});

  String id;
  String name;

  /// 1 : User
  /// 2 : Shopkeeper
  /// 3 : Admin
  int role;

  /// 1: Active
  /// 0: Disabled/Blocked
  /// -1: Deleted
  int status;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? dob;
  String? email;
  String? avatar;
  String bio;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"] ?? '',
        role: json["role"] ?? 1,
        status: json["status"] ?? 1,
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"]).toLocal()
            : null,
        updatedAt: json["updatedAt"] != null
            ? DateTime.parse(json["updatedAt"]).toLocal()
            : null,
        dob: json["dob"] != null ? DateTime.parse(json["dob"]) : null,
        email: json["email"] ?? '',
        avatar: json["avatar"] ?? '',
        bio: json["bio"] ?? '',
        phone: json["phone"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "role": role,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "dob": dob?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "email": email,
        "avatar": avatar,
        "bio": bio,
        "phone": phone,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
