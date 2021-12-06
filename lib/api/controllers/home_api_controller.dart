
import 'dart:convert';

import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/home_response.dart';
import 'package:http/http.dart' as http;

class HomeApiController with ApiHelper{

  Future<HomeResponse?> showHome() async {
    var url = Uri.parse(ApiSettings.home);
    var response = await http.get(url,headers: headers);

    if(response.statusCode == 200){
      return HomeResponse.fromJson(jsonDecode(response.body)['data']);
    }
    return null;
  }
}