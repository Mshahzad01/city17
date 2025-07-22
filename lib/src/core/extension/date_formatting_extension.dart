import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String dateFormat() {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String hourOnly() => DateFormat('hh:mm a').format(this);
  String dayOnly() => DateFormat('dd-EEEE').format(this);
}
