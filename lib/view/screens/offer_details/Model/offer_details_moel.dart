import 'dart:convert';

class OfferDetailsModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  OfferDetailsModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory OfferDetailsModel.fromRawJson(String str) => OfferDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfferDetailsModel.fromJson(Map<String, dynamic> json) => OfferDetailsModel(
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
  String? offerTitle;
  String? offerImage;
  List<String>? offerDetails;
  int? v;

  Data({
    this.id,
    this.offerTitle,
    this.offerImage,
    this.offerDetails,
    this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    offerTitle: json["offerTitle"],
    offerImage: json["offerImage"],
    offerDetails: json["offerDetails"] == null ? [] : List<String>.from(json["offerDetails"]!.map((x) => x)),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "offerTitle": offerTitle,
    "offerImage": offerImage,
    "offerDetails": offerDetails == null ? [] : List<dynamic>.from(offerDetails!.map((x) => x)),
    "__v": v,
  };
}
