
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

  void openEntryPage(BuildContext context, TimeEntryData ted) {
    Navigator.push(
      context,
      FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle:  '${StaticUtility.formatDate(ted.entryTime)} ${StaticUtility.formatTime(ted.entryTime)}', page: TimeEntryPage(ted: ted)))
    );
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
                  onPressed: () { 
                    final TimeEntryData newTed = TimeEntryData(
                      id: Statics.autoIncSim++,
                      entryName: 'New entry',
                      entryTime: DateTime(widget.date.year, widget.date.month, widget.date.day, 12)
                    );

                    Statics.provider.addEvent(newTed);
                    this.openEntryPage(context, newTed);
                  }
                ),
              ),

              Expanded(
                child: ListView(
                  children: snapshot.data.map((entryData) {
                    return <Widget>[
                      Container(height: 20.0),

                      GestureDetector(
                        onTap: () => this.openEntryPage(context, entryData),
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