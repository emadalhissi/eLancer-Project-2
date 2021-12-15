import 'package:elancer_project_2/api/controllers/sub_category_api_controller.dart';
import 'package:elancer_project_2/models/api/category.dart';
import 'package:elancer_project_2/models/api/sub_category.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubCategoriesScreen extends StatefulWidget {
  const SubCategoriesScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  List<SubCategory> _subCategoryList = <SubCategory>[];
  late Future<List<SubCategory>> _future;

  @override
  void initState() {
    super.initState();
    _future = SubCategoryApiController().showSubCategory(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: 80.h,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 90.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5.r,
                  blurRadius: 7.r,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              },
              splashRadius: 1,
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Color(0xffB0B0B0),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FutureBuilder<List<SubCategory>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              _subCategoryList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: _subCategoryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SubCategoriesScreen(),
                        //   ),
                        // );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
                              offset:
                                  Offset(0, 2), // changes position of shadow
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
                                        _subCategoryList[index].imageUrl),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Text(
                                _subCategoryList[index].nameEn,
                                style: TextStyle(
                                  color: Color(0xff0B0B0B),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
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
      ),
    );
  }
}
