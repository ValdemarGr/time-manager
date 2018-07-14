
import 'package:flutter/material.dart';

import 'package:timemanager/calendar/calc/static_utility.dart';
import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/pages/calendar_date.dart';

import 'package:timemanager/templates/fast_left_slide_page_animation.dart';

import 'package:timemanager/config/themes.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double spacing = 5.0;

    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Themes.current_theme.outerCalendarBorderColor)),
      margin: EdgeInsets.all(spacing),
      child: GridView.count(
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        crossAxisCount: 6,
        children: List.generate(StaticUtility.daysInCurrentMonth(), (index) {
          int dateday = index+ 1;
          DateTime dateInQuestion = DateTime(DateTime.now().year, DateTime.now().month, dateday);

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
  }
}