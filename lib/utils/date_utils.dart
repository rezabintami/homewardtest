import 'package:intl/intl.dart';

class DateUtils {
  DateUtils._();

  static String standardFormat = "dd MMM yyyy";

  static String dateToString(DateTime time) {
    if (time == null) return "";
    var formatter = DateFormat(standardFormat);
    String formatted = formatter.format(time);
    return formatted;
  }
}
