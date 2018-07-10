import 'package:flutter/material.dart';

import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/config/themes.dart';

import 'package:timemanager/pages/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Themes.current_theme = Themes.defaultTheme(context);

    return new MaterialApp(
      home: new PageTemplate(
        pageTitle: 'Home',
        page: new HomePage(),
      )
    );
  }
}
