
import 'package:flutter/material.dart';

import 'package:timemanager/calendar/time_entry.dart';
import 'package:timemanager/provider/calendar_data_provider_c.dart';
import 'package:timemanager/calendar/time_entry_data.dart';

import 'dart:async';
import 'dart:io';

class TestingDataProvider extends CalendarDataProviderC {
  List<TimeEntryData> list;

  TestingDataProvider(){
    final DateTime dt = DateTime.now();

    list = <TimeEntryData>[
      TimeEntryData(
        entryName: 'First',
        entryTime: DateTime(dt.year, dt.month, dt.day, 9, 30)
      ),

      TimeEntryData(
        entryName: 'Second',
        entryTime: DateTime(dt.year, dt.month, dt.day, 12, 00)
      ),

      TimeEntryData(
        entryName: 'Third',
        entryTime: DateTime(dt.year, dt.month, dt.day, 18, 22)
      ),

      TimeEntryData(
        entryName: 'Third',
        entryTime: DateTime(dt.year, dt.month, dt.day, 18, 22)
      ),

      TimeEntryData(
        entryName: 'Third',
        entryTime: DateTime(dt.year, dt.month, dt.day, 18, 22)
      ),

      TimeEntryData(
        entryName: 'Third',
        entryTime: DateTime(dt.year, dt.month, dt.day, 18, 22)
      ),

      TimeEntryData(
        entryName: 'Third',
        entryTime: DateTime(dt.year, dt.month, dt.day, 18, 22)
      ),

      
    ];
  }

  @override
  void removeEvent(TimeEntryData ted) {
    list.remove(ted);
  }

  @override
  Future<List<TimeEntryData>> getData(DateTime dt) {
    return Future.delayed(const Duration(seconds: 0), () => list);
  }
}
