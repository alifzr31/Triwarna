import 'package:intl/intl.dart';

class AppHelpers {
  static String maskEmail(String email) {
    List<String> parts = email.split('@');
    String username = parts[0];
    String domain = parts[1];
    String maskedUsername =
        username.substring(0, 2) + '*' * (username.length - 1);
    return '$maskedUsername@$domain';
  }

  static String rupiahFormat(int currency) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
    );

    return formatter.format(currency);
  }

  static String thousandFormat(int currency) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: '',
      decimalDigits: 0,
    );

    return formatter.format(currency);
  }

  static String monthYearFormat(DateTime dateTime) {
    final formatter = DateFormat('MMMM yyyy');
    return formatter.format(dateTime);
  }

  static String yearFormat(DateTime dateTime) {
    final formatter = DateFormat('yyyy');
    return formatter.format(dateTime);
  }

  static String dateFormat(DateTime dateTime) {
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(dateTime);
  }

  static String dayDateFormat(DateTime dateTime) {
    final formatter = DateFormat('E, dd MMMM yyyy');
    return formatter.format(dateTime);
  }

  static String addSpaces(String input) {
    List<String> chunks = [];
    int length = input.length;
    for (int i = 0; i < length; i += 4) {
      chunks.add(input.substring(i, i + 4 < length ? i + 4 : length));
    }
    return chunks.join(' ');
  }
}
