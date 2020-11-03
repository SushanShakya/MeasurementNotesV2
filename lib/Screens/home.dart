import 'package:MeasurementNotesV2/Blocs/notes/note_cubit.dart';

import 'package:MeasurementNotesV2/Screens/customers.dart';
import 'package:MeasurementNotesV2/Screens/measurement_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final List<String> screens = ["Work", "Customers"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                      value: context.bloc<NoteCubit>(),
                      child: MeasurementForm())));
        },
        child: Icon(Icons.person_add_alt),
      ),
      body: CustomersList(),
    );
  }
}
