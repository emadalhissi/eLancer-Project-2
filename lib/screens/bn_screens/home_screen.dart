import 'package:elancer_project_2/get/home_getx_controller.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:elancer_project_2/widgets/product_container.dart';
import 'package:elancer_project_2/widgets/slider_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _sliderPageController;

  // late PageController _latestProductsPageController;
  int _sliderCurrentPage = 0;
  int _latestProductsCurrentPage = 0;

  HomeGetXController _homeGetxController = Get.put(HomeGetXController());

  @override
  void initState() {
    super.initState();
    _sliderPageController = PageController();
    // _latestProductsPageController = PageController();
  }

  @override
  void dispose() {
    _sliderPageController.dispose();
    // _latestProductsPageController.dispose();
    super.dispose();
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
      child: GetBuilder<HomeGetXController>(
        builder: (controller) {
          if (controller.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.homeResponse != null) {
            return ListView(
              children: [
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 190.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New collection',
                        style: TextStyle(
                          color: Color(0xff0B0B0B),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Expanded(
                        child: PageView(
                          physics: BouncingScrollPhysics(),
                          // clipBehavior: Clip.none,
                          // controller: _pageController,
                          padEnds: false,
                          controller: PageController(
                            viewportFraction: 0.9,
                            initialPage: 0,
                          ),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value) {
                            setState(() {
                              _sliderCurrentPage = value;
                            });
                          },
                          children: [
                            SliderImage(
                                image: controller
                                    .homeResponse!.slider[0].imageUrl),
                            // SliderImage(image: ''),
                            SliderImage(
                                image: controller
                                    .homeResponse!.slider[1].imageUrl),
                            SliderImage(
                                image: controller
                                    .homeResponse!.slider[2].imageUrl),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 330.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest Products',
                            style: TextStyle(
                              color: Color(0xff0B0B0B),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // TODO: add navigator to latest products screen
                            },
                            child: Text(
                              'More',
                              style: TextStyle(
                                color: Color(0xffFFCA27),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Expanded(
                        child: GridView.builder(
                          itemBuilder: (BuildContext context, index) {
                            return ProductContainer(
                              imageUrl: controller.homeResponse!.latestProducts[index].imageUrl,
                              title: controller.homeResponse!.latestProducts[index].nameEn,
                              description: controller.homeResponse!.latestProducts[index].infoEn,
                              price: controller.homeResponse!.latestProducts[index].price,
                            );
                          },
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 290.h,
                            mainAxisExtent: 156.w,
                            // childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 330.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Famous Products',
                            style: TextStyle(
                              color: Color(0xff0B0B0B),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/main_screen');
                            },
                            child: Text(
                              'More',
                              style: TextStyle(
                                color: Color(0xffFFCA27),
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      Expanded(
                        child: GridView.builder(
                          itemBuilder: (BuildContext context, index) {
                            return ProductContainer(
                              imageUrl: controller.homeResponse!
                                  .famousProducts[index].imageUrl,
                              title: controller.homeResponse!
                                  .famousProducts[index].nameEn,
                              description: controller.homeResponse!
                                  .famousProducts[index].infoEn,
                              price: controller.homeResponse!
                                  .famousProducts[index].price,
                              overal_rate: controller.homeResponse!
                                  .famousProducts[index].overalRate,
                              is_favorite: controller.homeResponse!
                                  .famousProducts[index].isFavorite,
                            );
                          },
                          itemCount: controller
                              .homeResponse!.famousProducts.length,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                          SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 290.h,
                            mainAxisExtent: 156.w,
                            // childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return const NoDataCenter();
          }
        },
      ),
    );
  }
}
