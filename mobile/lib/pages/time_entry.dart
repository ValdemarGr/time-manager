
import 'package:flutter/material.dart';

import 'package:timemanager/calendar/time_entry_data.dart';

import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/templates/fade_page_animation.dart';
import 'package:timemanager/templates/fast_left_slide_page_animation.dart';

import 'package:timemanager/calendar/calc/static_utility.dart';


class TimeEntryPage extends StatelessWidget {
  final TimeEntryData ted;

  TimeEntryPage({
    @required this.ted
  });

  @override
  Widget build(BuildContext context) {
    
    final Widget saveBtn = RaisedButton(
      child: Text('Save'),
      onPressed: () {
        Navigator.push(
          context,
          FadePageAnimation(builder: (context) => PageTemplate(pageTitle:  '${StaticUtility.formatTime(this.ted.entryTime)} ${this.ted.entryName}', page: TimeEntryPage(ted: ted)))
        );
      },
    );

    final Widget date = RaisedButton(
      child: Text('Date'),
      onPressed: () {
        showTimePicker(
          context: context,
          initialTime: TimeOfDay(
            hour: ted.entryTime.toLocal().hour,
            minute: ted.entryTime.toLocal().minute
          ),
        );
      },
    );

    return Align(
      child: Column(
        children: <Widget>[
          saveBtn,
          date
        ],
      )
    );
  }
}