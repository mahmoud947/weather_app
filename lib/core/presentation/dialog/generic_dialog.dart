import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();
typedef DialogCallBack<T> = Function(T?);

Future<T?> showGenericDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required DialogOptionBuilder optionBuilder,
  required DialogCallBack? callBack,
}) {
  final option = optionBuilder();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
        ),
        content: Text(
          title,
        ),
        actions: option.keys.map((optionTitle) {
          final value = option[optionTitle];
          return TextButton(
            onPressed: () {
              if (value == null) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop(value);
              }
            },
            child: Text(optionTitle),
          );
        }).toList(),
      );
    },
  ).then(
    (value) => callBack != null ? callBack(value) : null,
  );
}
