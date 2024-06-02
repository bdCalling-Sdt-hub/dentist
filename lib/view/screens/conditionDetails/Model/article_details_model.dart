import 'dart:convert';

class ArticleDetailsModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  ArticleDetailsModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory ArticleDetailsModel.fromRawJson(String str) => ArticleDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleDetailsModel.fromJson(Map<String, dynamic> json) => ArticleDetailsModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? articleName;
  String? patientCategory;
  String? articleCategory;
  String? buttonImage;
  List<String>? articleSlider;
  String? articleDetails;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.articleName,
    this.patientCategory,
    this.articleCategory,
    this.buttonImage,
    this.articleSlider,
    this.articleDetails,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    articleName: json["articleName"],
    patientCategory: json["patientCategory"],
    articleCategory: json["articleCategory"],
    buttonImage: json["buttonImage"],
    articleSlider: json["articleSlider"] == null ? [] : List<String>.from(json["articleSlider"]!.map((x) => x)),
    articleDetails: json["articleDetails"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "articleName": articleName,
    "patientCategory": patientCategory,
    "articleCategory": articleCategory,
    "buttonImage": buttonImage,
    "articleSlider": articleSlider == null ? [] : List<dynamic>.from(articleSlider!.map((x) => x)),
    "articleDetails": articleDetails,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
