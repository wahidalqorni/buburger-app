import 'package:intl/intl.dart';

class Config {

  // membuat fungsi currency
  static String convertToIdr(dynamic nominal, int decimalDigit) {
    
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR ',
      decimalDigits: decimalDigit,
    );

    return currencyFormatter.format(nominal);
  }

}