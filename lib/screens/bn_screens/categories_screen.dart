import 'package:elancer_project_2/api/controllers/category_api_controller.dart';
import 'package:elancer_project_2/models/api/category.dart';
import 'package:elancer_project_2/screens/sub_categories_screen.dart';
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
  final String image =
      'https://c4.wallpaperflare.com/wallpaper/480/897/69/room-blue-furniture-couch-wallpaper-preview.jpg';

  List<Category> _categoryList = <Category>[];
  late Future<List<Category>> _future;

  @override
  void initState() {
    super.initState();
    _future = CategoryApiController().showCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: FutureBuilder<List<Category>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            _categoryList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: _categoryList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategoriesScreen(category: _categoryList[index]),
                          ));
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
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      _categoryList[index].imageUrl),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              _categoryList[index].nameEn,
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
                                  '${_categoryList[index].productsCount}' +
                                      ' Products',
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
            return NoDataCenter();
          }
        },
      ),
      // child: GetBuilder<CategoriesGetXController> (
      //   builder: (controller) {
      //     if (controller.loading) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     } else if (controller.category != null) {
      //       return ;
      //     } else {
      //       return const NoDataCenter();
      //     }
      //   },
      // ),
    );
  }
}
