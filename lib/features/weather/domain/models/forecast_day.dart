import 'astro.dart';
import 'day.dart';
import 'hour.dart';

class ForecastDay {
  ForecastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hours,
  });
  final String date;
  final Day day;
  final Astro astro;
  final List<Hour?> hours;
}
