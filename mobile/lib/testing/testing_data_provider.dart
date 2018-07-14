
import 'package:flutter/material.dart';

import 'package:timemanager/calendar/time_entry.dart';
import 'package:timemanager/provider/calendar_data_provider_c.dart';
import 'package:timemanager/calendar/time_entry_data.dart';

class TestingDataProvider extends CalendarDataProviderC {
  @override
  List<TimeEntryData> getData() {
    return <TimeEntryData>[
      TimeEntryData(
        entryName: 'First'
      ),

      TimeEntryData(
        entryName: 'Second'
      ),

      TimeEntryData(
        entryName: 'Third'
      ),
    ];
  }
}
