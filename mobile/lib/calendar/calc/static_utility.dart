
import 'dart:core';

class StaticUtility {
  static int daysInCurrentMonth() {
    final DateTime current = DateTime.now();
    return DateTime(current.year, current.month % 12 + 1, 0).day;
  }
}