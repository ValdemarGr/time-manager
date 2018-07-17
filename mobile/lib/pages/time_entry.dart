
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:timemanager/calendar/time_entry_data.dart';

import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/templates/fade_page_animation.dart';
import 'package:timemanager/templates/fast_left_slide_page_animation.dart';

import 'package:timemanager/calendar/calc/static_utility.dart';

import 'package:timemanager/config/statics.dart';

class TimeEntryPage extends StatelessWidget {
  final TimeEntryData ted;

  TimeEntryPage({
    @required this.ted
  });

  void save(TimeEntryData newTed, BuildContext context) {
    Statics.provider.addEvent(newTed);

    Navigator.pop(context);
    Navigator.push(
      context,
      FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle:  '${StaticUtility.formatDate(ted.entryTime)} ${StaticUtility.formatTime(newTed.entryTime)}', page: TimeEntryPage(ted: newTed)))
    );
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = 30.0;
    final double eventNameLength = 200.0;

    final double basicRowSize = iconSize + eventNameLength;    

    final Widget delete = RaisedButton(
      child: Text('Delete'),
      onPressed: () {
        Statics.provider.removeEvent(this.ted);

        Navigator.pop(context);
      },
    );

    return ListView(
      children: <Widget>[
        Container(height: 20.0,),

        Align(
          child: Text(
            'Basic',
            style: TextStyle(
              fontSize: 30.0
            ),
          ),
        ),

        Container(height: 15.0,),

        Row(
          children: <Widget>[
            Container(width: MediaQuery.of(context).size.width / 2 - basicRowSize / 2,),

            Form(
              child: Column(
                children: <Widget>[
                  Container(
                    width: eventNameLength,
                    child: TextFormField(
                      onFieldSubmitted: (str) {
                        final TimeEntryData newTed = TimeEntryData(
                          id: ted.id,
                          entryTime: ted.entryTime,
                          entryName: str
                        );

                        print(str);

                        this.save(newTed, context);
                      },
                      initialValue: ted.entryName,
                      decoration: InputDecoration(),
                    )
                  )
                ],
              ),
            ),

            IconButton(
              icon: Icon(Icons.timer),
              iconSize: iconSize,
              onPressed: () {
                final Future<TimeOfDay> ftod = showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(
                    hour: ted.entryTime.toLocal().hour,
                    minute: ted.entryTime.toLocal().minute
                  ),
                );

                ftod.then((todval) {
                  final DateTime dt = this.ted.entryTime;
                  final DateTime newDt = DateTime(dt.year, dt.month, dt.day, todval.hour, todval.minute);
                  this.save(TimeEntryData(id: this.ted.id, entryName: this.ted.entryName, entryTime: newDt), context);
                });
              }
            )  
          ],
        ),

        Container(height: 15.0,),

        delete
      ],
    );
  }
}