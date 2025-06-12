import 'package:intl/intl.dart';

class Formating {
  static String date(DateTime date, String split) {
    return DateFormat('yyyy${split}MM${split}dd').format(date);
  }

  static String time(DateTime date) {
    return DateFormat('HH:mm').format(date);
  }

  static String dateTime(DateTime date, String split) {
    return DateFormat('yyyy${split}MM${split}dd HH:mm').format(date);
  }

  static String money(int money) {
    return NumberFormat('###,###,###,###,###').format(money);
  }

  static String phone(String phone) {
    return phone.replaceAllMapped(RegExp(r'^(\d{3})(\d{3,4})(\d{4})'), (match) => '${match[1]}-${match[2]}-${match[3]}');
  }
}