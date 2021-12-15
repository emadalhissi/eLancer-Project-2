import 'dart:convert';

import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ContactApiController with ApiHelper {
  Future<bool> contact(
    BuildContext context, {
    required String subject,
    required String message,
  }) async {
    var url = Uri.parse(ApiSettings.contact);
    var response = await http.post(
      url,
      body: {
        'subject': subject,
        'message': message,
      },
      headers: headers,
    );
    if (response.statusCode == 201) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(
        context,
        message: message,
      );
      return true;
    } else if (response.statusCode == 400) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(
        context,
        message: message,
        error: true,
      );
    } else {
      showSnackBar(
        context,
        message: 'Something went wrong, please try again!',
        error: true,
      );
    }
    return false;
  }
}
