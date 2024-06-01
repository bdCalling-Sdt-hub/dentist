import 'dart:convert';

class BannerListDatum {
  String? id;
  String? bannerTitle;
  String? bannerImage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  BannerListDatum({
    this.id,
    this.bannerTitle,
    this.bannerImage,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory BannerListDatum.fromRawJson(String str) => BannerListDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BannerListDatum.fromJson(Map<String, dynamic> json) => BannerListDatum(
    id: json["_id"],
    bannerTitle: json["bannerTitle"],
    bannerImage: json["bannerImage"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "bannerTitle": bannerTitle,
    "bannerImage": bannerImage,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
