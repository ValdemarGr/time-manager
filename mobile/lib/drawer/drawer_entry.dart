
import 'package:flutter/material.dart';

class DrawerEntry extends StatelessWidget {
  final Icon icon;
  final String text;
  final GestureTapCallback tapHandle;

  DrawerEntry({
    @required
    this.tapHandle,
    @required
    this.icon,
    @required
    this.text
  });

  @override
  Widget build(BuildContext context) {

    return new GestureDetector(
      onTap: tapHandle,
      child: new Row(
        children: <Widget>[
          icon,
          new Text(
            text,
            style: new TextStyle(
              fontSize: 25.0
            ),
          )
        ],
      )
    );
  }
}