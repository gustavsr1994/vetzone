import 'package:intl/intl.dart';

class DateFormatter {
  String formatCalendar(DateTime input) {
    var dateFormat = DateFormat('dd MMM yyyy');
    var date = dateFormat.format(input);
    return date;
  }

}
