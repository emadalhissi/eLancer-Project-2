import 'package:elancer_project_2/models/api/base_api_response.dart';
import 'package:elancer_project_2/models/api/user.dart';

class BaseApiObjectResponse<T> extends BaseApiResponse {
  late T object;
  late T data;

  BaseApiObjectResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    if (json.containsKey('data')) {
      if (T == User) {
        data = User.fromJson(json['data']) as T;
      }
    }
    if (json.containsKey('object')) {}
  }
}
