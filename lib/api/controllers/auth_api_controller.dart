import 'dart:convert';

import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/base_api_object_response.dart';
import 'package:elancer_project_2/models/api/base_api_response.dart';
import 'package:elancer_project_2/models/api/user.dart';
import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelper {
  Future<bool> login(
    BuildContext context, {
    required String mobile,
    required String password,
  }) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
        'password': password,
      },
      // headers: headers,
    );
    if (response.statusCode == 200) {
      var baseApiResponse =
          BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body));
      showSnackBar(context, message: baseApiResponse.message);
      // await SharedPreferencesController().save(user: baseApiResponse.data);
      return true;
    } else if (response.statusCode == 400) {
      var message = jsonDecode(response.body)['message'];
      showSnackBar(
        context,
        message: message,
        error: true,
      );
    } else {
      showSnackBar(context,
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }

  Future<bool> register(
      BuildContext context, {
        required User user,
      }) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(
      url,
      body: {
        'name': user.name,
        'mobile': user.mobile,
        'password': user.password,
        'gender': user.gender,
        'STORE_API_KEY': ApiSettings.storeApiKey,
        'city_id': user.cityId.toString(),
      },
      headers: headers,
    );
    if (response.statusCode == 201) {
      print(response.statusCode);
      var baseApiResponse =
      BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body));
      showSnackBar(context, message: baseApiResponse.message);
      // await SharedPreferencesController().save(user: baseApiResponse.data);
      return true;
    } else if (response.statusCode == 400) {
      print(response.statusCode);
      var message = jsonDecode(response.body)['message'];
      showSnackBar(
        context,
        message: message,
        error: true,
      );
    } else {
      print(response.statusCode);
      showSnackBar(context,
          message: 'Something went wrong, please try again!', error: true);
    }
    return false;
  }
}
