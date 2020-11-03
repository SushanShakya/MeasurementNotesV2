import 'package:MeasurementNotesV2/Screens/home.dart';
import 'package:MeasurementNotesV2/Storage/db2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Blocs/notes/note_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().open();
  runApp(MeasurementNoteApp());
}

class MeasurementNoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notes",
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: TextStyle(fontSize: 24.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)))),
      home: BlocProvider<NoteCubit>(
        create: (context) => NoteCubit(),
        child: Home(),
      ),
    );
  }
}
