class Category {
  late int id;
  late String nameEn;
  late String nameAr;
  late String image;
  late String imageUrl;
  late num? productsCount = 0;

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    imageUrl = json['image_url'];
    productsCount = json['products_count'];
  }
}
