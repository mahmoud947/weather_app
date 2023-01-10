import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class ConditionDto {
  const ConditionDto({
    this.condition,
    this.iconUrl,
  });
  final String? condition;
  final String? iconUrl;

  factory ConditionDto.fromMap(Map<String, dynamic> map) {
    return ConditionDto(
      condition: map['text'],
      iconUrl: 'https://${map['icon']}',
    );
  }

  factory ConditionDto.fromJson(String source) =>
      ConditionDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
