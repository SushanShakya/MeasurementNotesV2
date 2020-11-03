import 'dart:convert';

Note noteFromJson(String str) => Note.fromJson(json.decode(str));

String noteToJson(Note data) => json.encode(data.toJson());

class Note {
  Note({
    this.id,
    this.length,
    this.chest,
    this.waist,
    this.hip,
    this.sholder,
    this.chirne,
    this.pher,
    this.baulaLength,
    this.baulaBreath,
    this.surwalLength,
    this.surwalBreath,
    this.surwalKnee,
    this.surwalDesign,
    this.neckFront,
    this.neckBack,
    this.frontNeck,
    this.backNeck,
    this.name,
    this.phone,
    this.address,
    this.image,
  });

  int id;
  String length;
  String chest;
  String waist;
  String hip;
  String sholder;
  String chirne;
  String pher;
  String baulaLength;
  String baulaBreath;
  String surwalLength;
  String surwalBreath;
  String surwalKnee;
  String surwalDesign;
  String neckFront;
  String neckBack;
  String frontNeck;
  String backNeck;
  String name;
  String phone;
  String address;
  String image;

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        length: json["length"],
        chest: json["chest"],
        waist: json["waist"],
        hip: json["hip"],
        sholder: json["sholder"],
        chirne: json["chirne"],
        pher: json["pher"],
        baulaLength: json["baula_length"],
        baulaBreath: json["baula_breath"],
        surwalLength: json["surwal_length"],
        surwalBreath: json["surwal_breath"],
        surwalKnee: json["surwal_knee"],
        surwalDesign: json["surwal_design"],
        neckFront: json["neck_front"],
        neckBack: json["neck_back"],
        frontNeck: json["frontNeck"],
        backNeck: json["backNeck"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "chest": chest,
        "waist": waist,
        "hip": hip,
        "sholder": sholder,
        "chirne": chirne,
        "pher": pher,
        "baula_length": baulaLength,
        "baula_breath": baulaBreath,
        "surwal_length": surwalLength,
        "surwal_breath": surwalBreath,
        "surwal_knee": surwalKnee,
        "surwal_design": surwalDesign,
        "neck_front": neckFront,
        "neck_back": neckBack,
        "frontNeck": frontNeck,
        "backNeck": backNeck,
        "name": name,
        "phone": phone,
        "address": address,
        "image": image,
      };
}
