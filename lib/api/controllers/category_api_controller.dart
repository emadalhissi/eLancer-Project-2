import 'dart:convert';

import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/category.dart';
import 'package:http/http.dart' as http;

class CategoryApiController with ApiHelper {
  Future<Category?> showCategory() async {
    var url = Uri.parse(ApiSettings.category);
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body)['list']);
    }
    return null;
  }
}
