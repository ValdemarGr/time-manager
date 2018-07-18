
import 'package:flutter/material.dart';

import 'package:timemanager/calendar/time_entry/time_entry.dart';
import 'package:timemanager/provider/calendar_data_provider_c.dart';
import 'package:timemanager/calendar/time_entry/time_entry_data.dart';

import 'dart:async';
import 'dart:io';

class TestingDataProvider extends CalendarDataProviderC {
  List<TimeEntryData> list = List<TimeEntryData>();

  @override
  void removeEvent(TimeEntryData ted) {
    list.remove(ted);
  }

  @override
  Future<List<TimeEntryData>> getData(DateTime dt) async {
    this.list.sort((first, second) {
      return first.entryTime.difference(second.entryTime).inSeconds;
    });

    return this.list.where((x) => x.entryTime.day == dt.day && x.entryTime.month == dt.month && x.entryTime.year == dt.year).toList();
  } 

  @override
  void updateItem(int index, TimeEntryData ted) {
    if (this.list.length <= index) {
      return;
    }

    this.list[index] = ted;
  }

  @override
  void addEvent(TimeEntryData ted) {
    final int found = this.list.indexWhere((x) => x.id == ted.id);

    found != -1 ? this.updateItem(found, ted) : this.list.add(ted);
  }
}
