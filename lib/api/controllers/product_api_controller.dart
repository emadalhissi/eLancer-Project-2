import 'dart:convert';
import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/city.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:http/http.dart' as http;

class ProductApiController with ApiHelper {
  Future<Product?> getProduct({required int id}) async {
    var url = Uri.parse(ApiSettings.products.replaceFirst("{id}", id.toString()));
    print(url);
    var response = await http.get(
      url,
      headers: headers,
    );
    print('outside IF code ---------- ${response.statusCode}');
    var message = jsonDecode(response.body)['message'];
    print('outside IF message ---------- $message');
    if (response.statusCode == 200) {
      print('inside IF ----------- ${response.statusCode}');
      var productResponse = Product.fromJson(jsonDecode(response.body)['object']);
      return productResponse;
    }
    return null;
  }
}
