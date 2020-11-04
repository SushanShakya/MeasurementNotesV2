import 'package:MeasurementNotesV2/Storage/utility.dart';
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
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: image != null
                            ? Utility.imageFromBase64String(image)
                            : AssetImage("assets/notfound.png"),
                        fit: BoxFit.fill)),
                width: MediaQuery.of(context).size.width / 2.5,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 10.0),
                child: child,
              ))
            ],
          ),
        ));
  }
}
