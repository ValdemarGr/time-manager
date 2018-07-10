
import 'package:flutter/material.dart';
import 'package:timemanager/util/tuple.dart';

class MyThemeData {
    final ThemeData themeData;


  MyThemeData({
    @required
    this.themeData,
  });
}

class Themes {
  static MyThemeData current_theme;

  static MyThemeData defaultTheme(BuildContext context) {
    return MyThemeData(
      themeData: Theme.of(context),
    );
  }
}