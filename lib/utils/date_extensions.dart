import 'package:intl/intl.dart';

extension StringExtension on String {
  String get formatDateToyMd {
    try {
      return DateFormat('yyyy-MM-dd').format(DateTime.parse(this).toLocal());
    } catch (e) {
      return this;
    }
  }
}
