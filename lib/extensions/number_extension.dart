import 'package:intl/intl.dart';

extension NumberParsing on int {
  String toAccountBalance() {
    final currencyFormatter = new NumberFormat("#,##0.00", "en_US");
    final finalCurrency = "${currencyFormatter.format(this / 100)} PLN";

    return finalCurrency.replaceAll(',', ' ');
  }
}
