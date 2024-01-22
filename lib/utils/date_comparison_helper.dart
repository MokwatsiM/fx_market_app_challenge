mixin DateComparisonHelper {
  static checkWeekedn({required DateTime date}) {
    if (date.weekday == DateTime.saturday) {
      return date.subtract(const Duration(days: 1));
    } else if (date.weekday == DateTime.sunday) {
      return date.subtract(const Duration(days: 2));
    } else {
      return date;
    }
  }
}
