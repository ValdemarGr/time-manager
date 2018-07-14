
import 'package:flutter/material.dart';

class TimeEntry extends StatelessWidget {
  final double sideMargins;
  final double height;
  final Widget foreground;
  final Widget background;

  final Function rightSwipe;
  final Function leftSwipe;

  TimeEntry({
    @required
    this.sideMargins,
    @required
    this.height,
    @required
    this.foreground,
    @required
    this.background,
    @required
    this.rightSwipe,
    @required
    this.leftSwipe
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      margin: EdgeInsets.only(left: this.sideMargins, right: this.sideMargins),
      child: Stack(
        children: <Widget>[
          background,

          GestureDetector(
            onTap: () => print(''),
            child: foreground
          ),
        ],
      )
    );
  }
}
