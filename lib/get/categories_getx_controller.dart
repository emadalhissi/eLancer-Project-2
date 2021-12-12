import 'package:elancer_project_2/api/controllers/category_api_controller.dart';
import 'package:elancer_project_2/api/controllers/home_api_controller.dart';
import 'package:elancer_project_2/models/api/category.dart';
import 'package:elancer_project_2/models/api/home_response.dart';
import 'package:get/get.dart';

class CategoriesGetXController extends GetxController {
  Category? category;
  bool loading = false;
  final CategoryApiController _categoryApiController = CategoryApiController();

  @override
  void onInit() {
    // TODO: implement onInit
    getCategories();
    super.onInit();
  }

  Future<void> getCategories() async {
    loading = true;
    category = await _categoryApiController.showCategory();
    loading = false;
    update();
  }
}
