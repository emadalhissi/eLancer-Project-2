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
      headers: headers,
    );
    if (response.statusCode == 200) {
      var baseApiResponse =
          BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body));
      showSnackBar(context, message: baseApiResponse.message);
      Map<String, dynamic> responseBodyData = jsonDecode(response.body)['data'];
      if (responseBodyData.containsKey('token')) {
        SharedPreferencesController()
            .setToken(token: responseBodyData['token']);
      }
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
      var baseApiResponse =
          BaseApiObjectResponse<User>.fromJson(jsonDecode(response.body));
      showSnackBar(context, message: baseApiResponse.message);
      var code = jsonDecode(response.body)['code'];
      print(code);
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

  Future<bool> activate(
    BuildContext context, {
    required String mobile,
    required String code,
  }) async {
    var url = Uri.parse(ApiSettings.activate);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
        'code': code,
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
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

  Future<bool> forget(
    BuildContext context, {
    required String mobile,
  }) async {
    var url = Uri.parse(ApiSettings.forget);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['message'];
      var code = jsonDecode(response.body)['code'];
      print(code);
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

  Future<bool> change(
    BuildContext context, {
    required String currentPassword,
    required String newPassword,
    required String repeatPassword,
  }) async {
    var url = Uri.parse(ApiSettings.change);
    var response = await http.post(
      url,
      body: {
        'current_password': currentPassword,
        'new_password': newPassword,
        'new_password_confirmation': repeatPassword,
      },
      headers: headers,
    );

    if (response.statusCode == 200) {
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

  Future<bool> reset(
    BuildContext context, {
    required String mobile,
    required String code,
    required String password,
    required String passwordConfirmation,
  }) async {
    var url = Uri.parse(ApiSettings.reset);
    var response = await http.post(
      url,
      body: {
        'mobile': mobile,
        'code': code,
        'password': password,
        'password_confirmation': passwordConfirmation,
      },
      headers: headers,
    );
    if (response.statusCode == 200) {
      var message = jsonDecode(response.body)['message'];
      var code = jsonDecode(response.body)['code'];
      showSnackBar(
        context,
        message: message,
      );
      print(code);
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

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 401) {
      return true;
    }
    return false;
  }
}
