import 'dart:io';
import 'package:MeasurementNotesV2/Blocs/notes/note_cubit.dart';
import 'package:MeasurementNotesV2/Controller/notes_controller.dart';
import 'package:MeasurementNotesV2/Models/note_model.dart';
import 'package:MeasurementNotesV2/Screens/Widgets/appbar.dart';
import 'package:MeasurementNotesV2/Screens/Widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:MeasurementNotesV2/Screens/Widgets/success_dialog.dart';

enum Mode { add, edit, view }

class MeasurementForm extends StatefulWidget {
  final Mode mode;
  final Note note;
  MeasurementForm({Key key, this.mode = Mode.add, this.note}) : super(key: key);

  @override
  _MeasurementFormState createState() => _MeasurementFormState();
}

class _MeasurementFormState extends State<MeasurementForm> {
  final kurtha = [
    'length',
    'chest',
    'waist',
    'hip',
    'sholder',
    'chirne',
    'pher',
    'baula_length',
    'baula_breath',
  ];

  final neck = ['neck_front', 'neck_back'];

  final surwal = [
    'surwal_length',
    'surwal_breath',
    'surwal_knee',
    'surwal_design',
  ];

  final customerInfo = ['name', 'phone', 'address'];

  final Map<String, String> nepali = {
    'name': "नाम",
    'phone': "नम्बर",
    'address': "Address",
    'length': "लम्बाई",
    'chest': "छाती",
    'waist': "कम्मर",
    'hip': "हिप",
    'sholder': "कुम",
    'chirne': "चिर्ने",
    'pher': "फेर",
    'baula_length': "बा. लम्बाई",
    'baula_breath': "बा. मोताई",
    'surwal_length': "सु. लम्बाई",
    'surwal_breath': "सु. मोताई",
    'surwal_knee': "सु. घुडा",
    'surwal_design': "सु. Design",
    'backNeck': "प गल्ला",
    'frontNeck': "अ. गल्ला",
    'neck_back': "प. गल्ला",
    'neck_front': "अ. गल्ला",
  };

  final Map<String, TextEditingController> controller = {
    'name': TextEditingController(),
    'phone': TextEditingController(),
    'address': TextEditingController(),
    'length': TextEditingController(),
    'chest': TextEditingController(),
    'waist': TextEditingController(),
    'hip': TextEditingController(),
    'sholder': TextEditingController(),
    'chirne': TextEditingController(),
    'pher': TextEditingController(),
    'baula_length': TextEditingController(),
    'baula_breath': TextEditingController(),
    'surwal_length': TextEditingController(),
    'surwal_breath': TextEditingController(),
    'surwal_knee': TextEditingController(),
    'surwal_design': TextEditingController(),
    'neck_front': TextEditingController(),
    'neck_back': TextEditingController(),
  };

  final Map<String, FocusNode> focusNode = {
    'name': FocusNode(),
    'phone': FocusNode(),
    'address': FocusNode(),
    'chest': FocusNode(),
    'waist': FocusNode(),
    'hip': FocusNode(),
    'sholder': FocusNode(),
    'chirne': FocusNode(),
    'pher': FocusNode(),
    'baula_length': FocusNode(),
    'baula_breath': FocusNode(),
    'surwal_length': FocusNode(),
    'surwal_breath': FocusNode(),
    'surwal_knee': FocusNode(),
    'surwal_design': FocusNode(),
    'neck_front': FocusNode(),
    'neck_back': FocusNode(),
  };

  final Map<String, TextInputType> textInputType = {
    'name': TextInputType.name,
    'phone': TextInputType.number,
    'address': TextInputType.name,
    'length': TextInputType.numberWithOptions(decimal: true),
    'chest': TextInputType.numberWithOptions(decimal: true),
    'waist': TextInputType.numberWithOptions(decimal: true),
    'hip': TextInputType.numberWithOptions(decimal: true),
    'sholder': TextInputType.numberWithOptions(decimal: true),
    'chirne': TextInputType.numberWithOptions(decimal: true),
    'pher': TextInputType.name,
    'baula_length': TextInputType.numberWithOptions(decimal: true),
    'baula_breath': TextInputType.numberWithOptions(decimal: true),
    'surwal_length': TextInputType.numberWithOptions(decimal: true),
    'surwal_breath': TextInputType.numberWithOptions(decimal: true),
    'surwal_knee': TextInputType.numberWithOptions(decimal: true),
    'surwal_design': TextInputType.numberWithOptions(decimal: true),
    'neck_message': TextInputType.name,
  };

  String frontNeckimageFile;
  String backNeckimageFile;

  String userImage;

  ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    if (widget.mode != Mode.add) {
      initializeControllers();
    }
  }

  void initializeControllers() {
    controller['name'].text = widget.note.name;
    controller['phone'].text = widget.note.phone;
    controller['address'].text = widget.note.address;
    controller['length'].text = widget.note.length;
    controller['chest'].text = widget.note.chest;
    controller['waist'].text = widget.note.waist;
    controller['hip'].text = widget.note.hip;
    controller['sholder'].text = widget.note.sholder;
    controller['chirne'].text = widget.note.chirne;
    controller['pher'].text = widget.note.pher;
    controller['baula_length'].text = widget.note.baulaLength;
    controller['baula_breath'].text = widget.note.baulaBreath;
    controller['surwal_length'].text = widget.note.surwalLength;
    controller['surwal_breath'].text = widget.note.surwalBreath;
    controller['surwal_knee'].text = widget.note.surwalKnee;
    controller['surwal_design'].text = widget.note.surwalDesign;
    backNeckimageFile = widget.note.backNeck;
    frontNeckimageFile = widget.note.frontNeck;
    controller['neck_back'].text = widget.note.neckBack;
    controller['neck_front'].text = widget.note.neckFront;
    userImage = widget.note.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Measurements"),
      body: _buildForm(context),
      bottomNavigationBar: Visibility(
        visible: widget.mode != Mode.view,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                  visible: widget.mode == Mode.edit,
                  child: Expanded(
                      child: SimpleRoundIconButton(
                    text: "Delete",
                    icon: Icons.delete,
                    backgroundColor: Colors.red,
                    onPressed: () async {
                      bool value = await showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text("Delete ?"),
                            content:
                                Text("Are you sure you want to delete this ?"),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text("No"),
                              ),
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          ));
                      if (value) {
                        await NotesController().deleteNote(widget.note.id);
                        context.bloc<NoteCubit>().getAllNotes();
                        showSuccessDialog(context, "Deleted Successfully");
                      }
                    },
                  ))),
              Visibility(
                visible: widget.mode == Mode.edit,
                child: SizedBox(
                  width: 10.0,
                ),
              ),
              Expanded(
                child: SimpleRoundIconButton(
                  text: "Save",
                  icon: Icons.save,
                  onPressed: () async {
                    Note note = Note(
                        name: controller['name'].text,
                        phone: controller['phone'].text,
                        address: controller['address'].text,
                        length: controller['length'].text,
                        chest: controller['chest'].text,
                        waist: controller['waist'].text,
                        hip: controller['hip'].text,
                        sholder: controller['sholder'].text,
                        chirne: controller['chirne'].text,
                        pher: controller['pher'].text,
                        baulaLength: controller['baula_length'].text,
                        baulaBreath: controller['baula_breath'].text,
                        surwalLength: controller['surwal_length'].text,
                        surwalBreath: controller['surwal_breath'].text,
                        surwalKnee: controller['surwal_knee'].text,
                        surwalDesign: controller['surwal_design'].text,
                        neckBack: controller['neck_back'].text,
                        neckFront: controller['neck_front'].text,
                        frontNeck: frontNeckimageFile,
                        backNeck: backNeckimageFile,
                        image: userImage);
                    if (widget.mode == Mode.add) {
                      await NotesController().insertNote(note);
                    } else {
                      note.id = widget.note.id;
                      await NotesController().updateNotes(note);
                    }

                    context.bloc<NoteCubit>().getAllNotes();

                    showSuccessDialog(context, "Saved Successfully");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.0),
      children: [
        _buildTemplate(title: "Kurtha", data: kurtha),
        _buildTemplate(title: "Surwal", data: surwal),
        _buildTemplate(title: "Neck", data: neck),
        // _buildTemplate(title: "Customer Info", data: customerInfo)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: (widget.mode == Mode.view)
                    ? () {}
                    : () {
                        showDialog(
                            context: context,
                            child: _alert(onCameraPressed: () async {
                              Navigator.pop(context);
                              final file = await _getImage(ImageSource.camera);
                              if (file != null) {
                                setState(() {
                                  frontNeckimageFile = file;
                                });
                              }
                            }, onGalleryPressed: () async {
                              Navigator.pop(context);
                              final file = await _getImage(ImageSource.gallery);
                              if (file != null) {
                                setState(() {
                                  frontNeckimageFile = file;
                                });
                              }
                            }));
                      },
                child: _imagePickContainer(frontNeckimageFile),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (widget.mode == Mode.view)
                    ? () {}
                    : () {
                        showDialog(
                            context: context,
                            child: _alert(onCameraPressed: () async {
                              Navigator.pop(context);
                              final file = await _getImage(ImageSource.camera);
                              if (file != null) {
                                setState(() {
                                  backNeckimageFile = file;
                                });
                              }
                            }, onGalleryPressed: () async {
                              Navigator.pop(context);
                              final file = await _getImage(ImageSource.gallery);
                              if (file != null) {
                                setState(() {
                                  backNeckimageFile = file;
                                });
                              }
                            }));
                      },
                child: _imagePickContainer(backNeckimageFile),
              ),
            ),
          ],
        ),
        _buildCustomerInfo(),
      ],
    );
  }

  Widget _imagePickContainer(String image) {
    return Container(
        margin: EdgeInsets.only(left: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey),
        height: 120,
        width: 100,
        child: image == null && widget.mode != Mode.view
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt),
                  Text(
                    'Add photo',
                    textAlign: TextAlign.center,
                  )
                ],
              )
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: image != null
                          ? FileImage(File(image))
                          : AssetImage("assets/notfound.png"),
                      fit: BoxFit.cover,
                    )),
              ));
  }

  Widget _buildCustomerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Customer Info",
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: [
            Expanded(
                child: Column(
              children: List.generate(
                  customerInfo.length,
                  (index) => Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 40.0,
                          child: IgnorePointer(
                            ignoring: widget.mode == Mode.view,
                            child: TextFormField(
                              keyboardType: textInputType[customerInfo[index]],
                              controller: controller[customerInfo[index]],
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 20.0),
                                  labelText: nepali[customerInfo[index]],
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always),
                              focusNode: (index == 0)
                                  ? null
                                  : focusNode[customerInfo[index]],
                              onEditingComplete: (index !=
                                      customerInfo.length - 1)
                                  ? () {
                                      FocusScope.of(context).requestFocus(
                                          focusNode[customerInfo[index + 1]]);
                                    }
                                  : () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    },
                            ),
                          ),
                        ),
                      )),
            )),
            GestureDetector(
                onTap: (widget.mode == Mode.view)
                    ? () {}
                    : () {
                        showDialog(
                            context: context,
                            child: _alert(onCameraPressed: () async {
                              Navigator.pop(context);
                              final file = await _getImage(ImageSource.camera);
                              if (file != null) {
                                setState(() {
                                  userImage = file;
                                });
                              }
                            }, onGalleryPressed: () async {
                              Navigator.pop(context);
                              final file = await _getImage(ImageSource.gallery);
                              if (file != null) {
                                setState(() {
                                  userImage = file;
                                });
                              }
                            }));
                      },
                child: _imagePickContainer(userImage))
          ],
        )
      ],
    );
  }

  Widget _buildTemplate({String title, List data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(
          height: 5.0,
        ),
        Wrap(
          children: List.generate(
              data.length,
              (index) => Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2 - 40.0,
                      child: IgnorePointer(
                        ignoring: widget.mode == Mode.view,
                        child: TextFormField(
                          keyboardType: textInputType[data[index]],
                          controller: controller[data[index]],
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25.0, vertical: 20.0),
                              labelText: nepali[data[index]],
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always),
                          focusNode:
                              (index == 0) ? null : focusNode[data[index]],
                          onEditingComplete: (index != data.length - 1)
                              ? () {
                                  FocusScope.of(context)
                                      .requestFocus(focusNode[data[index + 1]]);
                                }
                              : () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                        ),
                      ),
                    ),
                  )),
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }

  Widget _alert({Function onCameraPressed, Function onGalleryPressed}) {
    return AlertDialog(
      title: Text("Pick a source:"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Camera"),
            onTap: onCameraPressed,
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text("Gallery"),
            onTap: onGalleryPressed,
          ),
        ],
      ),
    );
  }

  Future<String> _getImage(ImageSource source) async {
    try {
      return (await _imagePicker.getImage(source: source)).path;
    } catch (e) {
      return null;
    }
  }
}
