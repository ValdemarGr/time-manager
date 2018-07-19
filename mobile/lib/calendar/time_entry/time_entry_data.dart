
import 'package:flutter/material.dart';

class TimeEntryData {
  int id;
  String entryName;
  DateTime entryTime;
  Color color;
  DateTime endTime;
  bool completable;
  bool isCompleted;

  TimeEntryData({
    this.id,
    this.entryName,
    this.entryTime,
    this.color = Colors.blueGrey,
    this.endTime,
    this.completable = false,
    this.isCompleted = false
  }) {
    if (this.endTime == null) {
      this.endTime = DateTime(entryTime.year, entryTime.month, entryTime.day, entryTime.hour + 1, entryTime.minute);
    }
  }
}