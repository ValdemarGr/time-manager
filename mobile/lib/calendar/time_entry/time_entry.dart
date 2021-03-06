
import 'package:flutter/material.dart';

import 'package:timemanager/calendar/calc/static_utility.dart';

class TimeEntry extends StatelessWidget {
  final double sideMargins;
  final double height;
  final Widget background;

  final Function onTap;

  final DateTime eventTime;
  final DateTime endTime;
  final String eventTitle;

  final Color color;

  TimeEntry({
    this.sideMargins = 0.0,
    this.height = 60.0,
    @required
    this.background,
    @required
    this.onTap,
    @required
    this.eventTime,
    @required this.endTime,
    @required
    this.eventTitle,
    @required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      margin: EdgeInsets.only(left: this.sideMargins, right: this.sideMargins),
      child: Stack(
        children: <Widget>[
          background,

          Row(
            children: <Widget>[
              Container(width: 25.0),

              Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Text(
                  this.eventTitle,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: this.height / 2 - 5.0
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: this.height - 20.0,
                      width: this.height - 20.0,
                      color: this.color,
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 25.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Builder(
                      builder: (context) {
                        return Column(
                          children: <Widget>[
                            Text(
                              StaticUtility.formatTime(this.eventTime),
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 25.0
                              ),
                            ),
                            Text(
                              StaticUtility.formatTime(this.endTime),
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 25.0
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  )
                )
              ),
            ],
          )
        ],
      )
    );
  }
}
