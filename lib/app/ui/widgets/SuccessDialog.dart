import 'package:flutter/material.dart';

Widget successDialog(String message) {
  return AlertDialog(
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("$message"),
    ),
  );
}
