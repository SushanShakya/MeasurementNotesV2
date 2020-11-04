import 'package:MeasurementNotesV2/Blocs/notes/note_cubit.dart';
import 'package:MeasurementNotesV2/Screens/Widgets/appbar.dart';

import 'package:MeasurementNotesV2/Screens/customers.dart';
import 'package:MeasurementNotesV2/Screens/measurement_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final List<String> screens = ["Work", "Customers"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Scaffold(
        appBar: appBar("Measurement Notes"),
        floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => BlocProvider.value(
                                value: context.bloc<NoteCubit>(),
                                child: MeasurementForm())));
                  },
                  child: Icon(Icons.person_add_alt),
                )),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) => TextField(
                  onChanged: context.bloc<NoteCubit>().filter,
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search), hintText: "Search"),
                ),
              ),
            ),
            Expanded(child: CustomersList()),
          ],
        ),
      ),
    );
  }
}
