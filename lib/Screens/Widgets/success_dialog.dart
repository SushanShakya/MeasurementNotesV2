import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialogue extends StatefulWidget {
  final String message;

  const SuccessDialogue({Key key, this.message}) : super(key: key);

  @override
  _SuccessDialogueState createState() => _SuccessDialogueState();
}

class _SuccessDialogueState extends State<SuccessDialogue>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Success !"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset("assets/success.json",
              controller: _controller,
              height: MediaQuery.of(context).size.width / 2.5,
              width: MediaQuery.of(context).size.width / 2.5,
              onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            _controller
              ..duration = composition.duration
              ..forward();
          }),
          Text(widget.message),
        ],
      ),
      actions: [
        FlatButton(
          child: Text("Ok"),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        )
      ],
    );
  }
}

showSuccessDialog(BuildContext context, String message) => showDialog(
    context: context,
    barrierDismissible: false,
    child: SuccessDialogue(
      message: message,
    ));
