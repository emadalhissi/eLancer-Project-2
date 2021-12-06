import 'package:elancer_project_2/api/controllers/home_api_controller.dart';
import 'package:elancer_project_2/models/api/home_response.dart';
import 'package:get/get.dart';

class HomeGetxController extends GetxController {
  HomeResponse? homeResponse;
  bool loading = false;
  final HomeApiController _apiController = HomeApiController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getHome() async {
    loading = true;
    homeResponse = await _apiController.showHome();
    loading = false;
    update();
  }
}
