import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialogue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
          content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: Lottie.asset(
                "assets/loading.json",
                height: MediaQuery.of(context).size.width / 2.5,
                width: MediaQuery.of(context).size.width / 2.5,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Loading...",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      )),
    );
  }
}

showLoadingDialogue(BuildContext context) => showDialog(
    context: context, child: LoadingDialogue(), barrierDismissible: false);
