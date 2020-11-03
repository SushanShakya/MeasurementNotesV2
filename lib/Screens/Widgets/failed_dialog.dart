import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorAlert extends StatelessWidget {
  final String message;

  const ErrorAlert({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Error !"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            "assets/error.json",
            height: MediaQuery.of(context).size.width / 2.5,
            width: MediaQuery.of(context).size.width / 2.5,
          ),
          Text(message),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

showErrorDialogue(BuildContext context, String message) => showDialog(
    context: context,
    child: ErrorAlert(
      message: message,
    ));
