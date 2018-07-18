
import 'package:flutter/material.dart';

class TimeEntryConfigSection extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;

  TimeEntryConfigSection({
    @required this.title,
    @required this.child,
    this.color = Colors.black
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          child: Text(
            this.title,
            style: TextStyle(
              fontSize: 30.0,
              color: this.color
            ),
          ),
        ),

        Container(height: 15.0,),

        child,

        Container(height: 15.0,),
      ],
    );
  }
}