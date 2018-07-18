
import 'package:flutter/material.dart';

class TimeEntryData {
  final int id;
  final String entryName;
  final DateTime entryTime;
  DateTime endTime;
  final Color color;

  TimeEntryData({
    this.id,
    this.entryName,
    this.entryTime,
    this.color = Colors.blueGrey,
    this.endTime
  }) {
    if (this.endTime == null) {
      this.endTime = DateTime(entryTime.year, entryTime.month, entryTime.day, entryTime.hour + 1, entryTime.minute);
    }
  }
}