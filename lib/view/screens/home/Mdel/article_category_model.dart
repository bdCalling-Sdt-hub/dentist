import 'dart:convert';

class ArticleCategoryMOdel {
  int? statusCode;
  bool? success;
  String? message;
  List<Datum>? data;

  ArticleCategoryMOdel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory ArticleCategoryMOdel.fromRawJson(String str) => ArticleCategoryMOdel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleCategoryMOdel.fromJson(Map<String, dynamic> json) => ArticleCategoryMOdel(
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
  String? articleCategoryName;
  String? articleCategoryImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Datum({
    this.id,
    this.articleCategoryName,
    this.articleCategoryImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    articleCategoryName: json["articleCategoryName"],
    articleCategoryImage: json["articleCategoryImage"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "articleCategoryName": articleCategoryName,
    "articleCategoryImage": articleCategoryImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
