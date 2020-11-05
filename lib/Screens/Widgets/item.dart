import 'dart:io';

import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final Widget child;
  final String image;

  const Item({Key key, this.image, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        child: Card(
          margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: (image != null)
                          ? FileImage(File(image))
                          : AssetImage("assets/id.jpg"),
                    )),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
                  child: child,
                ))
              ],
            ),
          ),
        ));
  }
}
