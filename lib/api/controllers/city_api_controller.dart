import 'dart:convert';
import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/city.dart';
import 'package:http/http.dart' as http;

class CityApiController with ApiHelper {
  Future<List<City>> getCity() async {
    var url = Uri.parse(ApiSettings.city);
    var response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      var cityJsonArray = jsonDecode(response.body)['list'] as List;
      return cityJsonArray.map((obj) => City.fromJson(obj)).toList();
    }
    return [];
  }
}
