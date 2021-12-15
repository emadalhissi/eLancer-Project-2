import 'package:elancer_project_2/api/controllers/favorite_products_api_controller.dart';
import 'package:elancer_project_2/api/controllers/home_api_controller.dart';
import 'package:elancer_project_2/models/api/favorite.dart';
import 'package:elancer_project_2/models/api/home_response.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteProductsGetXController extends GetxController {
  RxList<Product> favoriteProducts = <Product>[].obs;
  bool loading = false;
  final FavoriteProductsApiController _favoriteProductsApiController =
      FavoriteProductsApiController();

  static FavoriteProductsGetXController get to => Get.find();

  @override
  void onInit() {
    getFavorite();
    super.onInit();
  }

  Future<void> getFavorite() async {
    loading = true;
    favoriteProducts.value =
        await _favoriteProductsApiController.showFavorite();
    loading = false;
    update();
  }

  Future<bool> updateFavorite(
      {required BuildContext context, required Product product}) async {
    bool status = await _favoriteProductsApiController.changeFavorite(context, id: product.id);
    if (status) {
      if (!product.isFavorite) {
        print('Add');
        product.isFavorite = true;
        favoriteProducts.add(product);
      } else {
        print('Removed');
        favoriteProducts.removeWhere((element) => element.id == product.id);
      }
    }
    return status;
  }

  bool isFavorite(int productId) {
    int index = favoriteProducts.indexWhere((element) => element.id == productId);
    return index != -1;
  }
}
