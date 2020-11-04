import 'package:flutter/material.dart';

class SimpleRoundIconButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  final Function onPressed;
  final String text;

  SimpleRoundIconButton(
      {this.backgroundColor = Colors.blue,
      this.icon = Icons.play_arrow,
      this.onPressed,
      this.text = "Something"});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(20.0),
      onPressed: onPressed ?? () {},
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon == null
              ? SizedBox()
              : Icon(
                  icon,
                  color: Colors.white,
                ),
          SizedBox(
            width: 5.0,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 16.0, letterSpacing: 3.0),
          ),
        ],
      ),
    );
  }
}
