
import 'package:flutter/material.dart';

import 'package:timemanager/calendar/calc/static_utility.dart';
import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/pages/calendar_date.dart';

import 'package:timemanager/templates/fast_left_slide_page_animation.dart';
import 'package:timemanager/templates/fade_page_animation.dart';

import 'package:timemanager/config/themes.dart';

class CalendarPage extends StatelessWidget {
  DateTime ym;

  CalendarPage({
    this.ym
  }) {
    if (ym == null) {
      ym = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = 5.0;
    final double height = MediaQuery.of(context).size.width;

    final Widget calendar = Container(
      height: height,
      margin: EdgeInsets.all(spacing),
      child: GridView.count(
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        crossAxisCount: 6,
        children: List.generate(StaticUtility.daysInMonth(this.ym), (index) {
          int dateday = index+ 1;
          DateTime dateInQuestion = DateTime(ym.year, ym.month, dateday);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle: '$dateday-${dateInQuestion.month}-${dateInQuestion.year - 2000}', page: CalendarDate(date: dateInQuestion)))
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Themes.current_theme.innerCalendarBorderColor)
              ),
              child: Center(
                child: Text(
                  '${dateday}',
                  style: Theme.of(context).textTheme.headline,
                ),
              ),
            )
          );
        }),
      ),
    );

    return ListView(
      children: <Widget>[
        calendar,
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  iconSize: 120.0,
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle: 'Calendar', page: CalendarPage(ym: DateTime(
                        ym.month == 0 ? ym.year - 1 : ym.year,
                        ym.month == 0 ? DateTime.monthsPerYear : ym.month - 1,
                        1
                      ))))
                    );
                  },
                ),
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '${ym.month > 9 ? ym.month.toString() : '0' + ym.month.toString()}/${ym.year}',
                  style: TextStyle(
                    fontSize: 35.0
                  ),
                ),
              ),
            ),

            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  padding: EdgeInsets.all(0.0),
                  iconSize: 120.0,
                  icon: Icon(Icons.keyboard_arrow_right),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle: 'Calendar', page: CalendarPage(ym: DateTime(
                        ym.month + 1 > 12 ? ym.year + 1 : ym.year,
                        ym.month + 1 > 12 ? 1 : ym.month + 1,
                        1
                      ))))
                    );
                  },
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}