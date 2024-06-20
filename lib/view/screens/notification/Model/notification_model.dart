import 'dart:convert';

class NotificationModel {
  int? statusCode;
  bool? success;
  String? message;
  Pagination? pagination;
  int? unreadNotifications;
  List<NotificationDatum>? data;

  NotificationModel({
    this.statusCode,
    this.success,
    this.message,
    this.pagination,
    this.unreadNotifications,
    this.data,
  });

  factory NotificationModel.fromRawJson(String str) => NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    unreadNotifications: json["unreadNotifications"],
    data: json["data"] == null ? [] : List<NotificationDatum>.from(json["data"]!.map((x) => NotificationDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "pagination": pagination?.toJson(),
    "unreadNotifications": unreadNotifications,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class NotificationDatum {
  String? id;
  String? message;
  String? type;
  String? role;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? read;

  NotificationDatum({
    this.id,
    this.message,
    this.type,
    this.role,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.read,
  });

  factory NotificationDatum.fromRawJson(String str) => NotificationDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationDatum.fromJson(Map<String, dynamic> json) => NotificationDatum(
    id: json["_id"],
    message: json["message"],
    type: json["type"],
    role: json["role"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    read: json["read"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "message": message,
    "type": type,
    "role": role,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "read": read,
  };
}

class Pagination {
  int? limit;
  int? page;
  int? totalPage;
  int? total;

  Pagination({
    this.limit,
    this.page,
    this.totalPage,
    this.total,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    limit: json["limit"],
    page: json["page"],
    totalPage: json["totalPage"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "limit": limit,
    "page": page,
    "totalPage": totalPage,
    "total": total,
  };
}



// import 'package:dentist/view/screens/dentalCondition/Model/article_model.dart';
//
// class NotificationModel {
//   int? statusCode;
//   bool? success;
//   String? message;
//   Pagination? pagination;
//   int? unreadNotifications;
//   List<Datum>? data;
//
//   NotificationModel({
//     this.statusCode,
//     this.success,
//     this.message,
//     this.pagination,
//     this.unreadNotifications,
//     this.data,
//   });
//
//   factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
//     statusCode: json["statusCode"],
//     success: json["success"],
//     message: json["message"],
//     pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
//     unreadNotifications: json["unreadNotifications"],
//     data: json["data"] == null ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "success": success,
//     "message": message,
//     "pagination": pagination?.toJson(),
//     "unreadNotifications": unreadNotifications,
//     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }
// class Datum {
//   String? id;
//   String? message;
//   String? type;
//   String? role;
//   String? image;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//   bool? read;
//
//   Datum({
//     this.id,
//     this.message,
//     this.type,
//     this.role,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.read,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["_id"],
//     message: json["message"],
//     type: json["type"],
//     role: json["role"],
//     image: json["image"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//     read: json["read"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "message": message,
//     "type": type,
//     "role": role,
//     "image": image,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//     "read": read,
//   };
// }
