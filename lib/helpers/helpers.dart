import 'package:flutter/material.dart';

mixin Helpers {
  void show_SnackBar(
    BuildContext context, {
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20,
        ),
      ),
    );
  }
}
