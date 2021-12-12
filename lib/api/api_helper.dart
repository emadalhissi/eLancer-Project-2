import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';

mixin ApiHelper {
  void showSnackBar(
    BuildContext context, {
    required String message,
    bool error = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

  Map<String, String> get headers {
    var headers = {
      'Accept': 'application/json',
      'lang': SharedPreferencesController().checkLanguage,
    };
    if(SharedPreferencesController().loggedIn)
      headers['Authorization'] = SharedPreferencesController().getToken;
    return headers;
  }
}
