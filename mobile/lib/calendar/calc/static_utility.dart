
import 'dart:core';

class StaticUtility {
  static int daysInCurrentMonth() {
    return daysInMonth(DateTime.now());
  }

  static int daysInMonth(DateTime dt) {
    return DateTime(dt.year, dt.month % 12 + 1, 0).day;
  }

  static String formatTime(DateTime dt) {
    final int hour = dt.toLocal().hour;
    final int minute = dt.toLocal().minute;
    final String formattedHour = (hour < 10) ? '0$hour': '$hour';
    final String formattedMinute = (minute < 10) ? '0$minute': '$minute';

    return '$formattedHour:$formattedMinute';
  }

  static String formatDate(DateTime dt) {
    final int year = dt.toLocal().year;
    final int month = dt.toLocal().month;
    final int day = dt.toLocal().day;    
    final String formattedDay = (day < 10) ? '0$day': '$day';
    final String formattedMonth = (month < 10) ? '0$month': '$month';

    return '$formattedDay/$formattedMonth/$year';
  }
}