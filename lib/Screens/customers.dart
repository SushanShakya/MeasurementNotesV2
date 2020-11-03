import 'package:MeasurementNotesV2/Blocs/notes/note_cubit.dart';
import 'package:MeasurementNotesV2/Models/note_model.dart';
import 'package:MeasurementNotesV2/Screens/Widgets/item.dart';
import 'package:MeasurementNotesV2/Screens/measurement_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CustomersList extends StatefulWidget {
  @override
  _CustomersListState createState() => _CustomersListState();
}

class _CustomersListState extends State<CustomersList> {
  @override
  void initState() {
    super.initState();
    context.bloc<NoteCubit>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(builder: (context, state) {
      if (state is NoteFailed) return _buildError(state.message);
      if (state is NoteSuccess) return _buildSuccess(state.notes);
      return _buildLoading();
    });
  }

  Widget _buildError(String message) {
    return Center(
      child: Text(message),
    );
  }

  Widget _buildSuccess(List<Note> customers) {
    if (customers.length < 1)
      return Center(
        child: Text("No Customers Found."),
      );

    return RefreshIndicator(
      onRefresh: () async {
        setState(() {});
        return;
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search), hintText: "Search"),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemCount: customers.length,
                itemBuilder: (context, index) {
                  Note customer = customers[index];
                  return GestureDetector(
                    onTap: () {},
                    onLongPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                    value: context.bloc<NoteCubit>(),
                                    child: MeasurementForm(
                                      mode: Mode.edit,
                                      note: customer,
                                    ),
                                  )));
                    },
                    child: Item(
                      image: customer.image,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            customer.name,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(customer.phone),
                          Text(customer.address),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Lottie.asset(
        "assets/loading.json",
        height: MediaQuery.of(context).size.width / 2.5,
        width: MediaQuery.of(context).size.width / 2.5,
      ),
    );
  }
}
