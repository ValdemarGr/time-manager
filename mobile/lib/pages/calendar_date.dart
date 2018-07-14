
import 'package:flutter/material.dart';

import 'package:timemanager/testing/testing_data_provider.dart';
import 'package:timemanager/provider/calendar_data_provider_c.dart';

import 'package:timemanager/calendar/time_entry.dart';

import 'package:timemanager/config/statics.dart';

class CalendarDate extends StatelessWidget {

  final DateTime date;

  CalendarDate({
    @required
    this.date
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: Statics.provider.getData(this.date).map((entryData) {
        return <Widget>[
          Container(height: 40.0),

          TimeEntry(
            sideMargins: 0.0, 
            height: 60.0,
            foreground: Text(entryData.entryName),
            background: Container(color: Colors.blue),
            leftSwipe: () => print(''),
            rightSwipe: () => print(''),
          )
        ];
      }).expand((i) => i).toList()
    );
  }
}
