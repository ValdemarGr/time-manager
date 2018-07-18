
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:timemanager/calendar/time_entry/time_entry_data.dart';

import 'package:timemanager/calendar/time_entry/time_entry_config_section.dart';
import 'package:timemanager/templates/fast_left_slide_page_animation.dart';
import 'package:timemanager/templates/page_template.dart';

import 'package:timemanager/pages/calendar_date.dart';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:timemanager/config/statics.dart';
import 'package:timemanager/calendar/calc/static_utility.dart';

class TimeEntryPage extends StatefulWidget {
  final TimeEntryData ted;

  TimeEntryPage({
    @required this.ted
  });

  @override
  TimeEntryPageState createState() => TimeEntryPageState();
}

class TimeEntryPageState extends State<TimeEntryPage> {

  void colorChange(BuildContext context, Color color, TimeEntryData currentTed) {
    this.save(context, TimeEntryData(id: currentTed.id, entryName: currentTed.entryName, entryTime: currentTed.entryTime, color: color, endTime: currentTed.endTime));
  }

  void save(BuildContext context, TimeEntryData newTed) {
    print('save called');
    Statics.provider.addEvent(newTed);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Statics.provider.getData(widget.ted.entryTime),
      builder: (BuildContext context, AsyncSnapshot<List<TimeEntryData>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return new Container();
          }

          final TimeEntryData ted = snapshot.data.firstWhere((x) => x.id == widget.ted.id);
          Color changedToColor = ted.color;

          final double iconSize = 30.0;
          final double eventNameLength = 200.0;

          final double deleteButtonWidth = 160.0;
          final double buttonHeight = 50.0;

          final double basicRowSize = iconSize + eventNameLength;

          final double spacing = 5.0;

          final int colorCount = 3;

          final List<Color> colors = <Color>[
            Colors.green,
            Colors.redAccent,
            Colors.blueAccent,
            
            Colors.blueGrey,
            Colors.black,
            Colors.amber,

            Colors.yellowAccent,
            Colors.tealAccent,
            Colors.pinkAccent
          ];

          final Widget delete = RaisedButton(
            color: Colors.redAccent,
            child: Text(
              'Delete',
              style: TextStyle(
                fontSize: 30.0,
                color: Color.fromARGB(255, 190, 190, 200)
              ),
            ),
            onPressed: () {
              Navigator.popUntil(context, (route) => !Navigator.canPop(context));
              Navigator.push(
                context,
                FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle: StaticUtility.formatDate(ted.entryTime), page: CalendarDate(date: ted.entryTime)))
              );
              Statics.provider.removeEvent(ted);
            },
          );

          final TextEditingController _controller = new TextEditingController(text: ted.entryName);

          return ListView(
            children: <Widget>[
              Container(height: 20.0,),

              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (bcontext) {
                      return AlertDialog(
                        title: const Text('Name your event'),
                        content: Container(
                          child: TextField(
                            controller: _controller,
                            onChanged: (str) => this.save(context, TimeEntryData(id: ted.id, color: ted.color, endTime: ted.endTime, entryTime: ted.entryTime, entryName: str)),
                            decoration: InputDecoration(
                              hintText: 'Event name'
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Center(
                  child: Text(
                    ted.entryName,
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                ),
              ),
              
              
              Container(height: 20.0,),
        
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 5 + 10.0),
                        child: FlatButton(
                          child: Text(
                            StaticUtility.formatTime(ted.entryTime),
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.blue
                            ),
                          ),
                          onPressed: () {
                            final Future<TimeOfDay> ftod = showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(
                                hour: ted.entryTime.toLocal().hour,
                                minute: ted.entryTime.toLocal().minute
                              ),
                            );

                            ftod.then((todval) {
                              final DateTime dt = ted.entryTime;
                              final DateTime newDt = DateTime(dt.year, dt.month, dt.day, todval.hour, todval.minute);
                              this.save(context, TimeEntryData(id: ted.id, entryName: ted.entryName, entryTime: newDt, endTime: ted.endTime, color: ted.color));
                            });
                          },
                        ),
                      ),

                      Text(
                        '-',
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.blue
                        ),
                      ),

                      FlatButton(
                        child: Text(
                          StaticUtility.formatTime(ted.endTime),
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.blue
                          ),
                        ),
                        onPressed: () {
                          final Future<TimeOfDay> ftod = showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                              hour: ted.endTime.toLocal().hour,
                              minute: ted.endTime.toLocal().minute
                            ),
                          );

                          ftod.then((todval) {
                            final DateTime dt = ted.endTime;
                            final DateTime newDt = DateTime(dt.year, dt.month, dt.day, todval.hour, todval.minute);
                            this.save(context, TimeEntryData(id: ted.id, entryName: ted.entryName, endTime: newDt, entryTime: ted.entryTime, color: ted.color));
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),

              Container(height: 15.0,),

              TimeEntryConfigSection(
                color: ted.color,
                title: 'Color',
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      child: GridView.count(
                        crossAxisSpacing: spacing,
                        mainAxisSpacing: spacing,
                        crossAxisCount: colorCount,
                        children: colors.map((x) {
                          return GestureDetector(
                            onTap: () => this.colorChange(context, x, ted),
                            child: Container(
                              color: x,
                            ),
                          );
                        }).toList()
                      ),
                    ),

                    Container(height: 15.0,),

                    Container(
                      height: buttonHeight,
                      child: RaisedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              title: const Text('Pick a color'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: ted.color,
                                  onColorChanged: (c) => changedToColor = c,
                                  enableLabel: true,
                                  pickerAreaHeightPercent: 0.8,
                                ),
                              ),
                              actions: <Widget>[
                                Container(
                                  height: 40.0,
                                  width: 100.0,
                                  child: RaisedButton(
                                    child: new Text(
                                      'Close',
                                      style: TextStyle(
                                        fontSize: 20.0
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      this.colorChange(context, changedToColor, ted);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text(
                          'Custom color',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.blue
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: buttonHeight,
                //width: deleteButtonWidth,
                margin: EdgeInsets.only(left: Statics.marginFromWidth(context, deleteButtonWidth), right: Statics.marginFromWidth(context, deleteButtonWidth)),
                child: delete,
              ),
            ],
          );
        } else return Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator()
        );
      }
    ); 
  }
}