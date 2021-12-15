import 'package:elancer_project_2/api/controllers/favorite_products_api_controller.dart';
import 'package:elancer_project_2/get/favorite_getx_controller.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  FavoriteProductsGetXController _favoriteProductsGetXController =
      Get.put(FavoriteProductsGetXController());

  @override
  void initState() {
    super.initState();
    // _favoriteFuture = FavoriteProductsApiController().showFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 24.h,
        bottom: 0,
      ),
      child: GetBuilder<FavoriteProductsGetXController>(
        builder: (controller) {
          if (controller.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.favoriteProductsResponse.isNotEmpty) {
            return ListView.builder(
              itemCount: controller.favoriteProductsResponse.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                  child: Container(
                    height: 255.h,
                    width: 160.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2.r,
                          blurRadius: 2.r,
                          // offset: Offset(0, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.favoriteProductsResponse[index]!.imageUrl,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Expanded(
                                child: Text(
                                  controller.favoriteProductsResponse[index]!.nameEn,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff0B0B0B),
                                  ),
                                ),
                                flex: 0,
                              ),
                              SizedBox(height: 4.h),
                              Expanded(
                                child: Text(
                                  controller.favoriteProductsResponse[index]!.infoEn,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Text(
                                    '\$ ${controller.favoriteProductsResponse[index]!.price}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                      color: Color(0xffFFCA27),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    '${controller.favoriteProductsResponse[index]!.productRate}',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                    ),
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20.w,
                                    color: Color(0xffFFCA27),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  InkWell(
                                    child: Icon(
                                      Icons.favorite,
                                      // color: _isPressed ? Colors.red : Color(0xffB0B0B0),
                                      size: 20,
                                    ),
                                    onTap: () {
                                      setState(
                                            () {
                                          // _isPressed
                                          //     ? _isPressed = false
                                          //     : _isPressed = true;
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    child: Icon(
                                      Icons.add_shopping_cart_sharp,
                                      size: 20,
                                      color: Color(0xffB0B0B0),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    child: Icon(
                                      Icons.share,
                                      size: 20,
                                      color: Color(0xffB0B0B0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return NoDataCenter();
          }
        },
      ),
    );
  }
}
