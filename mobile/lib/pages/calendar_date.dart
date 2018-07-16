
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:timemanager/calendar/time_entry_data.dart';
import 'package:timemanager/calendar/time_entry.dart';
import 'package:timemanager/calendar/calc/static_utility.dart';

import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/templates/fast_left_slide_page_animation.dart';

import 'package:timemanager/pages/time_entry.dart';

import 'package:timemanager/config/statics.dart';

class CalendarDate extends StatefulWidget {
  final DateTime date;

  CalendarDate({
    @required this.date
  });

  @override
  CalendarDateState createState() => CalendarDateState();
}

class CalendarDateState extends State<CalendarDate> {

  void removeTimeEntry(TimeEntryData ted) {
    setState(() {
      Statics.provider.removeEvent(ted);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = 60.0;
    final double sideMargins = 0.0;

    return FutureBuilder(
      future: Statics.provider.getData(widget.date),
      builder: (BuildContext context, AsyncSnapshot<List<TimeEntryData>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () => Statics.provider.addEvent(TimeEntryData(
                    entryName: 'Added',
                    entryTime: DateTime.now()
                  ))
                ),
              ),

              Expanded(
                child: ListView(
                  children: snapshot.data.map((entryData) {
                    return <Widget>[
                      Container(height: 20.0),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle:  '${StaticUtility.formatTime(entryData.entryTime)} ${entryData.entryName}', page: TimeEntryPage(ted: entryData)))
                          );
                        },
                        child: TimeEntry(
                          sideMargins: 20.0, 
                          height: 60.0,
                          background: Container(color: Colors.blueGrey),
                          onTap: () => removeTimeEntry(entryData),
                          eventTitle: entryData.entryName,
                          eventTime: entryData.entryTime,
                        ),
                      ),
                      

                      Container(height: 20.0),
                    ];
                  }).expand((i) => i).toList()
                )
              ),

              
            ],
          );
        } else return Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator()
        );
      },
    );
  }
}