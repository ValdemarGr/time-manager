
import 'package:flutter/material.dart';

import 'package:timemanager/config/themes.dart';

import 'package:timemanager/drawer/drawer_entry.dart';
import 'package:timemanager/pages/home.dart';
import 'package:timemanager/pages/calendar.dart';

import 'package:timemanager/templates/fast_left_slide_page_animation.dart';

class PageTemplate extends StatelessWidget {
  final String pageTitle;
  final Widget page;

  PageTemplate({
    @required
    this.pageTitle,
    @required
    this.page
  });

  @override
  Widget build(BuildContext context) {
    final double topMargin = 25.0;
    final double leftMargin = 20.0;    

    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

    return new Scaffold(
      key: scaffoldKey,
      drawer: new Container(
        width: 200.0,
        child: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(margin: EdgeInsets.only(top: 50.0),),

              new Container(
                margin: EdgeInsets.only(left: leftMargin, top: topMargin),
                child: new DrawerEntry(
                  tapHandle: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageTemplate(pageTitle: 'Home', page: HomePage()))
                    );
                  },
                  icon: Icon(Icons.home),
                  text: ' Home'
                )
              ),

              new Container(
                margin: EdgeInsets.only(left: leftMargin, top: topMargin),
                child: new DrawerEntry(
                  tapHandle: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageTemplate(pageTitle: 'Calendar', page: CalendarPage()))
                    );
                  },
                  icon: Icon(Icons.help),
                  text: ' Calendar'
                )
              ),

              new Container(
                margin: EdgeInsets.only(left: leftMargin, top: topMargin),
                child: new DrawerEntry(
                  tapHandle: () => print('new event!'),
                  icon: Icon(Icons.help),
                  text: ' New event'
                )
              ),

            ],
          )
        ),
      ),

      appBar: new AppBar(
        leading: new IconButton(
          icon: Icon(Icons.arrow_back, size: 36.0,),
          onPressed: () => Navigator.pop(context),
        ),
        title: new Align(
          child: new Text(this.pageTitle),
          alignment: Alignment.center,
        ),
        
        
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.dehaze, size: 30.0),
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          )
        ],
      ),
      body: this.page,
    );
  }
}