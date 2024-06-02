import 'dart:convert';

class PrivacyPolicyModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  PrivacyPolicyModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory PrivacyPolicyModel.fromRawJson(String str) => PrivacyPolicyModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) => PrivacyPolicyModel(
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
  String? content;
  String? type;
  int? v;

  Data({
    this.id,
    this.content,
    this.type,
    this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    content: json["content"],
    type: json["type"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "content": content,
    "type": type,
    "__v": v,
  };
}
