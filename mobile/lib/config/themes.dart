
import 'package:flutter/material.dart';

class MyThemeData {
  final ThemeData themeData;
  final Color innerCalendarBorderColor;
  final Color outerCalendarBorderColor;

  MyThemeData({
    @required
    this.themeData,
    this.innerCalendarBorderColor,
    this.outerCalendarBorderColor
  });
}

class Themes {
  static MyThemeData current_theme;

  static MyThemeData defaultTheme(BuildContext context) {
    return MyThemeData(
      themeData: Theme.of(context),
      innerCalendarBorderColor: Colors.grey,
      outerCalendarBorderColor: Colors.blueAccent
    );
  }
}