import 'package:flutter/foundation.dart' show immutable;

@immutable
class Condition {
  const Condition({
    required this.condition,
    required this.iconUrl,
  });
  final String condition;
  final String iconUrl;
}
