import 'dart:convert';
import 'dart:io';
import 'package:MeasurementNotesV2/Models/tuple.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

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

  Future<MultiPage> covertToPdfWidgets(Document doc) async {
    List<Tuple> _kurtha = [
      Tuple("Length", length),
      Tuple("Chest", chest),
      Tuple("Waist", waist),
      Tuple("Hip", hip),
      Tuple("Sholder", sholder),
      Tuple("Chirne", chirne),
      Tuple("Pher", pher),
      Tuple("Baula Length", baulaLength),
      Tuple("Baula Breadth", baulaBreath),
    ];

    List<Tuple> _surwal = [
      Tuple("Length", surwalLength),
      Tuple("Breadth", surwalBreath),
      Tuple("Knee", surwalKnee),
      Tuple("Design", surwalDesign),
    ];

    final PdfImage frontNeckImage = (frontNeck == null)
        ? null
        : PdfImage.file(
            doc.document,
            bytes: await File(frontNeck).readAsBytes(),
          );

    final PdfImage backNeckImage = (backNeck == null)
        ? null
        : PdfImage.file(
            doc.document,
            bytes: await File(backNeck).readAsBytes(),
          );

    final PdfImage userImage = (image == null)
        ? PdfImage.file(
            doc.document,
            bytes:
                (await rootBundle.load('assets/id.jpg')).buffer.asUint8List(),
          )
        : PdfImage.file(
            doc.document,
            bytes: await File(image).readAsBytes(),
          );

    return MultiPage(
        pageFormat: PdfPageFormat.a4,
        crossAxisAlignment: CrossAxisAlignment.start,
        build: (Context context) => <Widget>[
              Row(children: [
                _buildImage(userImage),
                Padding(padding: EdgeInsets.only(left: 20.0)),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(name,
                      style: Theme.of(context).defaultTextStyle.copyWith(
                          fontWeight: FontWeight.bold, fontSize: 28.0)),
                  Text(address),
                  Text(phone),
                ])
              ]),
              SizedBox(height: 20.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildContainerWithTitle(
                          'Kurtha', _buildData(_kurtha)),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: _buildContainerWithTitle(
                          'Surwal', _buildData(_surwal)),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                        child: _buildContainerWithTitle(
                            'Neck',
                            Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Front Neck"),
                                        Text("\t:\t"),
                                        Expanded(child: Text(neckFront))
                                      ]),
                                  SizedBox(height: 10.0),
                                  _buildImage(frontNeckImage),
                                  SizedBox(height: 10.0),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Back Neck"),
                                        Text("\t:\t"),
                                        Expanded(child: Text(neckBack)),
                                      ]),
                                  SizedBox(height: 10.0),
                                  _buildImage(backNeckImage)
                                ]))),
                  ]),
              // Partitions(children: [
              //   Partition(
              //       child: _buildContainerWithTitle(
              //           'Kurtha', _buildData(_kurtha))),
              //   Partition(
              //     child: Column(children: [Container(width: 10.0)]),
              //   ),
              //   Partition(
              //       child: _buildContainerWithTitle(
              //           'Surwal', _buildData(_surwal))),
              //   Partition(
              //     child: Column(children: [Container(width: 10.0)]),
              //   ),
              //   Partition(
              //     child: _buildContainerWithTitle(
              //         'Neck',
              //         Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               SizedBox(height: 10.0),
              //               Row(children: [
              //                 Text("Front Neck"),
              //                 Text("\t:\t"),
              //                 Text(neckFront)
              //               ]),
              //               SizedBox(height: 10.0),
              //               _buildImage(frontNeckImage),
              //               SizedBox(height: 10.0),
              //               Row(children: [
              //                 Text("Back Neck"),
              //                 Text("\t:\t"),
              //                 Text(neckBack)
              //               ]),
              //               SizedBox(height: 10.0),
              //               _buildImage(backNeckImage)
              //             ])),
              //   )
              // ]),
            ]);
  }

  _buildImage(PdfImage image) {
    return (image == null)
        ? Container()
        : Container(
            decoration: BoxDecoration(
                border: BoxBorder(
                    left: true, right: true, top: true, bottom: true)),
            width: 100,
            height: 100,
            child: Image(image));
  }

  _buildContainerWithTitle(String title, Widget child) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Header(level: 1, text: title), child]);
  }

  _buildData(List<Tuple> children) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children
            .map((e) => Padding(
                padding: EdgeInsets.only(top: 10.0),
                child:
                    Row(children: [Text(e.key), Text("\t:\t"), Text(e.value)])))
            .toList());
  }
}
