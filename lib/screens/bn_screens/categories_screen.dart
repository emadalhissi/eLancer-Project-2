import 'package:elancer_project_2/get/categories_getx_controller.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  CategoriesGetXController _categoriesGetXController = Get.put(CategoriesGetXController());


  final String image =
      'https://c4.wallpaperflare.com/wallpaper/480/897/69/room-blue-furniture-couch-wallpaper-preview.jpg';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: GetBuilder<CategoriesGetXController> (
        builder: (controller) {
          if (controller.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.category != null) {
            return ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      // TODO: add navigator to single category screen show it's sub categories
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      width: MediaQuery.of(context).size.width,
                      height: 230.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5.r,
                            blurRadius: 7.r,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 135.h,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'Electronics',
                              style: TextStyle(
                                color: Color(0xff0B0B0B),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.visibility,
                                      size: 20,
                                      color: Color(0xffFFCA27),
                                    ),
                                    Text(
                                      ' ' + '1652',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFCA27),
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '3 Products',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffB0B0B0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const NoDataCenter();
          }
        },
      ),
    );
  }
}
