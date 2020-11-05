import 'dart:convert';

class Note {
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

  Note copyWith({
    int id,
    String length,
    String chest,
    String waist,
    String hip,
    String sholder,
    String chirne,
    String pher,
    String baulaLength,
    String baulaBreath,
    String surwalLength,
    String surwalBreath,
    String surwalKnee,
    String surwalDesign,
    String neckFront,
    String neckBack,
    String frontNeck,
    String backNeck,
    String name,
    String phone,
    String address,
    String image,
  }) {
    return Note(
      id: id ?? this.id,
      length: length ?? this.length,
      chest: chest ?? this.chest,
      waist: waist ?? this.waist,
      hip: hip ?? this.hip,
      sholder: sholder ?? this.sholder,
      chirne: chirne ?? this.chirne,
      pher: pher ?? this.pher,
      baulaLength: baulaLength ?? this.baulaLength,
      baulaBreath: baulaBreath ?? this.baulaBreath,
      surwalLength: surwalLength ?? this.surwalLength,
      surwalBreath: surwalBreath ?? this.surwalBreath,
      surwalKnee: surwalKnee ?? this.surwalKnee,
      surwalDesign: surwalDesign ?? this.surwalDesign,
      neckFront: neckFront ?? this.neckFront,
      neckBack: neckBack ?? this.neckBack,
      frontNeck: frontNeck ?? this.frontNeck,
      backNeck: backNeck ?? this.backNeck,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'length': length,
      'chest': chest,
      'waist': waist,
      'hip': hip,
      'sholder': sholder,
      'chirne': chirne,
      'pher': pher,
      'baulaLength': baulaLength,
      'baulaBreath': baulaBreath,
      'surwalLength': surwalLength,
      'surwalBreath': surwalBreath,
      'surwalKnee': surwalKnee,
      'surwalDesign': surwalDesign,
      'neckFront': neckFront,
      'neckBack': neckBack,
      'frontNeck': frontNeck,
      'backNeck': backNeck,
      'name': name,
      'phone': phone,
      'address': address,
      'image': image,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Note(
      id: map['id'],
      length: map['length'],
      chest: map['chest'],
      waist: map['waist'],
      hip: map['hip'],
      sholder: map['sholder'],
      chirne: map['chirne'],
      pher: map['pher'],
      baulaLength: map['baulaLength'],
      baulaBreath: map['baulaBreath'],
      surwalLength: map['surwalLength'],
      surwalBreath: map['surwalBreath'],
      surwalKnee: map['surwalKnee'],
      surwalDesign: map['surwalDesign'],
      neckFront: map['neckFront'],
      neckBack: map['neckBack'],
      frontNeck: map['frontNeck'],
      backNeck: map['backNeck'],
      name: map['name'],
      phone: map['phone'],
      address: map['address'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Note(id: $id, length: $length, chest: $chest, waist: $waist, hip: $hip, sholder: $sholder, chirne: $chirne, pher: $pher, baulaLength: $baulaLength, baulaBreath: $baulaBreath, surwalLength: $surwalLength, surwalBreath: $surwalBreath, surwalKnee: $surwalKnee, surwalDesign: $surwalDesign, neckFront: $neckFront, neckBack: $neckBack, frontNeck: $frontNeck, backNeck: $backNeck, name: $name, phone: $phone, address: $address, image: $image)';
  }
}
