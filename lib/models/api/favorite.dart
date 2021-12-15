import 'package:elancer_project_2/models/api/pivot.dart';

class Favorite {
 late int id;
 late String nameEn;
 late String nameAr;
 late String infoEn;
 late String infoAr;
 late num price;
 late int quantity;
 late int overalRate;
 late int subCategoryId;
 late int productRate;
 late num? offerPrice;
 late bool isFavorite;
 late String imageUrl;
 late Pivot pivot;

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
    pivot = (json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null)!;
  }
}