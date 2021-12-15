import 'dart:convert';

import 'package:elancer_project_2/api/api_helper.dart';
import 'package:elancer_project_2/api/api_settings.dart';
import 'package:elancer_project_2/models/api/faq.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FaqApiController with ApiHelper {
  Future<List<Faq>> showFaq() async {
    var url = Uri.parse(ApiSettings.faqs);
    var response = await http.get(
      url,
      headers: headers,
    );

    if(response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body)['list'] as List;
      return jsonResponse.map((obj) => Faq.fromJson(obj)).toList();
    }
    return [];
  }
}
