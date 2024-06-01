import 'dart:convert';

class SmartCheckModel {
  int? statusCode;
  bool? success;
  String? message;
  List<Datum>? data;

  SmartCheckModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory SmartCheckModel.fromRawJson(String str) => SmartCheckModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SmartCheckModel.fromJson(Map<String, dynamic> json) => SmartCheckModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? smartCheckLink;
  String? smartCheckImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.smartCheckLink,
    this.smartCheckImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    smartCheckLink: json["smartCheckLink"],
    smartCheckImage: json["smartCheckImage"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "smartCheckLink": smartCheckLink,
    "smartCheckImage": smartCheckImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
