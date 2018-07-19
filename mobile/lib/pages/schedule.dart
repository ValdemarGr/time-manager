
import 'package:flutter/material.dart';

import 'package:timemanager/config/statics.dart';
import 'package:timemanager/templates/fast_left_slide_page_animation.dart';
import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/pages/time_entry.dart';

import 'package:timemanager/calendar/time_entry/time_entry_data.dart';

class SchedulePage extends StatelessWidget {

  double getMarginFromLeft(BuildContext context, DateTime dt, double margins) {
    final double width = MediaQuery.of(context).size.width;
    final double currentHour = (dt.hour.toDouble() + dt.minute.toDouble() / 60) * 0.95;
    return (currentHour / 24.0) * (width - margins * 2);
  }

  @override
  Widget build(BuildContext context) {
    final double margins = MediaQuery.of(context).size.width * 0.072;

    //final double currentHour = DateTime.now().hour.toDouble() + DateTime.now().minute.toDouble() / 60;
    final double displacement = getMarginFromLeft(context, DateTime.now(), margins);

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: margins, top: 5.0),
          child: GridView.count(
            crossAxisCount: 7,
            children: <Widget>[
              Text(00.toString()),
              Text(04.toString()),
              Text(08.toString()),
              Text(12.toString()),
              Text(16.toString()),
              Text(20.toString()),
              Text(24.toString()),
            ],
          ),
        ),

        Container(
          child: FutureBuilder(
            future:  Statics.provider.getData(DateTime.now()),
            builder: (BuildContext context, AsyncSnapshot<List<TimeEntryData>> snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: <Widget>[Container(height: 20.0,)] + snapshot.data.map((x) {

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle: 'Event', page: TimeEntryPage(ted: x)))
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 6.0,
                          left: getMarginFromLeft(context, x.entryTime, margins) + margins,
                          right: MediaQuery.of(context).size.width - (getMarginFromLeft(context, x.endTime, margins) + margins)
                        ),
                        height: 20.0,
                        width: 50.0,
                        decoration: new ShapeDecoration(
                          color: x.isCompleted ? Colors.green : x.color,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.all(Radius.circular(9.0)),
                          ),
                        ),
                      ),
                    );
                        /*Builder(
                          builder: (context) {
                            if (x.completable) {
                              return Container(
                                margin: EdgeInsets.only(
                                  left: getMarginFromLeft(context, x.endTime, margins) - getMarginFromLeft(context, x.entryTime, margins) - 15.0,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    x.isCompleted = !x.isCompleted;
                                  },
                                  icon: Icon(Icons.check_circle),
                                  iconSize: 30.0,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),*/


                  }).toList()
                );
              } else {
                return Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()
                );
              }
            }
          )
        ),

        Container(
          width: 8.0,
          margin: EdgeInsets.only(top: 23.0, left: margins + displacement),
          height: MediaQuery.of(context).size.height - 110.0,
          decoration: new ShapeDecoration(
            color: Colors.blue,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ),
      ],
    );
  }
}
