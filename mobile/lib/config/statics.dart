
import 'dart:core';

import 'package:flutter/material.dart';

import 'package:timemanager/provider/testing_data_provider.dart';
import 'package:timemanager/provider/calendar_data_provider_c.dart';

class Statics {
  static final CalendarDataProviderC provider = new TestingDataProvider();
  static final double timeEntryMargin = 20.0;
}
