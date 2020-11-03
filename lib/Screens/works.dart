import 'package:MeasurementNotesV2/Models/note_model.dart';
import 'package:MeasurementNotesV2/Screens/Widgets/item.dart';
import 'package:MeasurementNotesV2/Screens/measurement_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DueWorksList extends StatefulWidget {
  @override
  _DueWorksListState createState() => _DueWorksListState();
}

class _DueWorksListState extends State<DueWorksList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _buildSuccess(List<Note> works) {
    if (works.length < 1)
      return Center(
        child: Text("No Due Works"),
      );

    return ListView.builder(
        itemCount: works.length,
        padding: EdgeInsets.all(10.0),
        // itemCount: 3,
        itemBuilder: (context, index) {
          Note work = works[index];
          return GestureDetector(
            onLongPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MeasurementForm(
                            mode: Mode.edit,
                          )));
            },
            child: Item(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    work.name ?? "",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    work.phone ?? "",
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildLoading() {
    return Center(
      child: SizedBox(
          height: 30.0, width: 30.0, child: CircularProgressIndicator()),
    );
  }
}
