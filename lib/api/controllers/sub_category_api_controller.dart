import 'dart:convert';

import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/category.dart';
import 'package:elancer_project_2/models/api/sub_category.dart';
import 'package:http/http.dart' as http;

class SubCategoryApiController with ApiHelper {
  Future<List<SubCategory>> showSubCategory({
    required Category category,
  }) async {
    var url = Uri.parse(ApiSettings.subCategory + '/${category.id}');
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      return jsonResponse.map((obj) => SubCategory.fromJson(obj)).toList();
    }
    return [];
  }
}
