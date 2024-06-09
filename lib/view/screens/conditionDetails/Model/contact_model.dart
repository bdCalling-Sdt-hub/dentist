// import 'dart:convert';
//
// class ContactModel {
//   int? statusCode;
//   bool? success;
//   String? message;
//   Data? data;
//
//   ContactModel({
//     this.statusCode,
//     this.success,
//     this.message,
//     this.data,
//   });
//
//   factory ContactModel.fromRawJson(String str) => ContactModel.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
//     statusCode: json["statusCode"],
//     success: json["success"],
//     message: json["message"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "statusCode": statusCode,
//     "success": success,
//     "message": message,
//     "data": data?.toJson(),
//   };
// }
//
// class Data {
//   String? id;
//   String? contact;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   int? v;
//
//   Data({
//     this.id,
//     this.contact,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//   });
//
//   factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["_id"],
//     contact: json["contact"],
//     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     v: json["__v"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "contact": contact,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "__v": v,
//   };
// }


import 'dart:convert';

class ContactModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  ContactModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory ContactModel.fromRawJson(String str) => ContactModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
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
  String? contact;
  String? email;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.contact,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    contact: json["contact"],
    email: json["email"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "contact": contact,
    "email": email,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
