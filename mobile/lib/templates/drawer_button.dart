
import 'package:flutter/material.dart';

import 'package:timemanager/templates/page_template.dart';
import 'package:timemanager/drawer/drawer_entry.dart';

import 'package:timemanager/templates/fast_left_slide_page_animation.dart';

class DrawerButton extends StatelessWidget {
  final double leftMargin;
  final double topMargin;
  final Widget page;
  final String title;
  final Widget icon;

  DrawerButton({
    @required
    this.leftMargin,
    @required
    this.topMargin,
    @required
    this.page,
    @required
    this.title,
    @required
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(left: leftMargin, top: topMargin),
      child: new DrawerEntry(
        tapHandle: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            FastLeftSlidePageAnimation(builder: (context) => PageTemplate(pageTitle: title, page: page))
          );
        },
        icon: icon,
        text: ' $title'
      )
    );
  }
}