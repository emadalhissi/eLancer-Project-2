import 'package:elancer_project_2/api/controllers/favorite_products_api_controller.dart';
import 'package:elancer_project_2/api/controllers/home_api_controller.dart';
import 'package:elancer_project_2/models/api/favorite.dart';
import 'package:elancer_project_2/models/api/home_response.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:get/get.dart';

class FavoriteProductsGetXController extends GetxController {
  late List<Product?> favoriteProductsResponse;
  bool loading = false;
  final FavoriteProductsApiController _favoriteProductsApiController = FavoriteProductsApiController();

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }

  Future<void> getFavorite() async {
    loading = true;
    favoriteProductsResponse = await _favoriteProductsApiController.showFavorite();
    loading = false;
    update();
  }
}
