
import 'package:flutter/material.dart';

class TimeEntry extends StatelessWidget {
  final double sideMargins;
  final double height;
  final Widget child;

  final Function rightSwipe;
  final Function leftSwipe;

  TimeEntry({
    @required
    this.sideMargins,
    @required
    this.height,
    @required
    this.child,
    @required
    this.rightSwipe,
    @required
    this.leftSwipe
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: this.height,
      margin: EdgeInsets.only(left: this.sideMargins, right: this.sideMargins),
      child: GestureDetector(
        onTap: () => print(''),
        child: this.child
      ),
    );
  }
}
