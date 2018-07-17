
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:timemanager/calendar/time_entry_data.dart';

abstract class CalendarDataProviderC {
  void removeEvent(TimeEntryData ted);
  Future<List<TimeEntryData>> getData(DateTime dt);
  void addEvent(TimeEntryData ted);
  void updateItem(int index, TimeEntryData ted);
}
