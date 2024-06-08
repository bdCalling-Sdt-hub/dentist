import 'dart:convert';

class MessageDatum{
  String? id;
  String? chatId;
  String? sender;
  String? image;
  String? text;
  String? messageType;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  MessageDatum({
    this.id,
    this.chatId,
    this.sender,
    this.image,
    this.text,
    this.messageType,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MessageDatum.fromRawJson(String str) => MessageDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MessageDatum.fromJson(Map<String, dynamic> json) => MessageDatum(
    id: json["_id"],
    chatId: json["chatId"],
    sender: json["sender"],
    image: json["image"],
    text: json["text"],
    messageType: json["messageType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "chatId": chatId,
    "sender": sender,
    "image": image,
    "text": text,
    "messageType": messageType,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
