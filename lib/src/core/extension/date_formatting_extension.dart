import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String dateFormat() {
    return DateFormat('dd-MM-yyyy').format(this);
  }
}

extension HourFormat on DateTime {
  String hourOnly() => DateFormat('hh:mm a').format(this);
}

extension dayformat on DateTime {
  String dayOnly() => DateFormat('dd-EEEE').format(this);
}
