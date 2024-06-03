import 'dart:convert';

class ProfileModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  ProfileModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  String? email;
  String? role;
  Patient? patient;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.email,
    this.role,
    this.patient,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    email: json["email"],
    role: json["role"],
    patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
    status: json["status"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "role": role,
    "patient": patient?.toJson(),
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Patient {
  String? id;
  String? name;
  String? contactNo;
  int? age;
  String? dateOfBirth;
  String? gender;
  String? plan;
  String? category;
  String? profile;

  Patient({
    this.id,
    this.name,
    this.contactNo,
    this.age,
    this.dateOfBirth,
    this.gender,
    this.plan,
    this.category,
    this.profile,
  });

  factory Patient.fromRawJson(String str) => Patient.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
    id: json["_id"],
    name: json["name"],
    contactNo: json["contactNo"],
    age: json["age"],
    dateOfBirth: json["dateOfBirth"],
    gender: json["gender"],
    plan: json["plan"],
    category: json["category"],
    profile: json["profile"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "contactNo": contactNo,
    "age": age,
    "dateOfBirth": dateOfBirth,
    "gender": gender,
    "plan": plan,
    "category": category,
    "profile": profile,
  };
}
