import 'dart:convert';

import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:elancer_project_2/models/api/sub_category.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_project_2/api/api_helper.dart';

class SubCategoryProductsApiController with ApiHelper {
  Future<List<Product>> showSubCategoryProducts({required SubCategory subCategory}) async {
    var url = Uri.parse(ApiSettings.subCategoryProducts + '/${subCategory.id}');
    var response = await http.get(
      url,
      headers: headers,
    );

    if(response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      return jsonResponse.map((obj) => Product.fromJson(obj)).toList();
    }
    return [];
  }
}
