import 'package:elancer_project_2/models/api/base_api_response.dart';
import 'package:elancer_project_2/models/api/category.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:elancer_project_2/models/api/slider.dart';

class HomeResponse {
  late List<Slider> slider;
  late List<Category> categories;
  late List<Product> latestProducts;
  late List<Product> famousProducts;

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider.add(Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories.add(Category.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <Product>[];
      json['latest_products'].forEach((v) {
        latestProducts.add(Product.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = <Product>[];
      json['famous_products'].forEach((v) {
        famousProducts.add(Product.fromJson(v));
      });
    }
  }
}
