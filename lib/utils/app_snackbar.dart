import 'package:flutter/material.dart';

void showAppSnackBar({
  required BuildContext context,
  required String text,
  required Function(SnackBarClosedReason) closedCallback,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)))
      .closed
      .then(closedCallback);
}
