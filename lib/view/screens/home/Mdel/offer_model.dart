import 'dart:convert';

class OfferModel {
  int? statusCode;
  bool? success;
  String? message;
  List<Datum>? data;

  OfferModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory OfferModel.fromRawJson(String str) => OfferModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
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
  String? offerTitle;
  String? offerImage;
  List<String>? offerDetails;
  int? v;

  Datum({
    this.id,
    this.offerTitle,
    this.offerImage,
    this.offerDetails,
    this.v,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
