import 'dart:convert';

class ArticaleModel {
  int? statusCode;
  bool? success;
  String? message;
  Pagination? pagination;
  List<Datum>? data;

  ArticaleModel({
    this.statusCode,
    this.success,
    this.message,
    this.pagination,
    this.data,
  });

  factory ArticaleModel.fromRawJson(String str) => ArticaleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticaleModel.fromJson(Map<String, dynamic> json) => ArticaleModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "pagination": pagination?.toJson(),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
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

  Datum({
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

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

class Pagination {
  int? page;
  int? limit;
  int? totalPage;
  int? total;

  Pagination({
    this.page,
    this.limit,
    this.totalPage,
    this.total,
  });

  factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    page: json["page"],
    limit: json["limit"],
    totalPage: json["totalPage"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "totalPage": totalPage,
    "total": total,
  };
}
