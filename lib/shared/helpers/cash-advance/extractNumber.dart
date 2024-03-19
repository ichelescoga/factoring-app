import 'package:intl/intl.dart';

String? currencyToStrNumber(String input) {
  RegExp regex = RegExp(r'[\d.,]+');
  String? match = regex.stringMatch(input);

  if (match != null) {
    match = match.replaceAll(RegExp(r'[^\d.]'), '');
    return match;
  }

  return null;
}

double extractDouble(String input) {
  RegExp regex = RegExp(r'[\d,.]+');
  String numberString = regex.firstMatch(input)?.group(0) ?? '0';
  numberString = numberString.replaceAll(',', '');

  return double.tryParse(numberString) ?? 0.0;
}

String simpleNumberCurrency(String input) {
  RegExp regex = RegExp(r'Q\s*([\d,.]+)');
  String numberString = regex.firstMatch(input)?.group(1) ?? '0';

  return numberString;
}

String formatDateGt(String _date) {
  DateTime _newDate = DateTime.parse(_date);

  String _formateDate = DateFormat('dd/MM/yy').format(_newDate);

  return _formateDate;
}
