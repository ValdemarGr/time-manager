
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
      children: Statics.provider.getData().map((entryData) {

        return Column(
          children: <Widget>[
            Container(height: 20.0),

            TimeEntry(
              sideMargins: 10.0, 
              height: 40.0,
              child: Text(entryData.entryName),
              leftSwipe: () => print(''),
              rightSwipe: () => print(''),
            )
          ],
        );
      }).toList()
    );
  }
}
