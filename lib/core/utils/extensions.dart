import 'package:intl/intl.dart';

final _dayFormatter = DateFormat.E();
final _amPmFormatter = DateFormat.jm();

extension StringOrEmpty on String? {
  String orEmpty() => this ?? '';
}

extension DoubleOrZero on double? {
  double orZero() => this ?? 0;
}

extension IntOrZero on int? {
  int orZero() => this ?? 0;
}

extension UrlOrFake on String? {
  String orFakeUrl() => this ?? 'https://www.fakeexample.com/fake.png';
}

extension ParseAsDateTime on String? {
  DateTime? parseAsDateTime() {
    try {
      return DateTime.parse(orEmpty());
    } on Exception {
      return null;
    }
  }
}

extension ToDayName on DateTime? {
  String toDayName() {
    if (this != null) {
      return _dayFormatter.format(this!);
    }
    return '';
  }
}

extension GetTimeAmPm on DateTime? {
  String timeAmPm() {
    if (this != null) {
      return _amPmFormatter.format(this!).replaceAll(':00', '');
    }
    return '';
  }
}
