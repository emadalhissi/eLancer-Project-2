import 'dart:convert';
import 'package:elancer_project_2/models/api/offer_product.dart';
import 'package:http/http.dart' as http;
import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';

class OffersApiController with ApiHelper {
  Future<List<OfferProduct>> showOffers() async {
    var url = Uri.parse(ApiSettings.offers);
    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      return jsonResponse.map((obj) => OfferProduct.fromJson(obj)).toList();
    }
    return [];
  }
}
