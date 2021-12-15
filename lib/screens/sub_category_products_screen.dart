import 'package:elancer_project_2/api/controllers/sub_category_products_api_controller.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:elancer_project_2/models/api/sub_category.dart';
import 'package:elancer_project_2/screens/product_screen.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:elancer_project_2/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryProductsScreen extends StatefulWidget {
  const SubCategoryProductsScreen({
    Key? key,
    required this.subCategory,
  }) : super(key: key);

  final SubCategory subCategory;

  @override
  _SubCategoryProductsScreenState createState() =>
      _SubCategoryProductsScreenState();
}

class _SubCategoryProductsScreenState extends State<SubCategoryProductsScreen> {
  List<Product> _productsList = <Product>[];
  late Future<List<Product>> _future;

  @override
  void initState() {
    super.initState();
    _future = SubCategoryProductsApiController()
        .showSubCategoryProducts(subCategory: widget.subCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: FutureBuilder<List<Product>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _productsList = snapshot.data ?? [];
                return GridView.builder(
                  itemBuilder: (BuildContext context, index) {
                    return ProductContainer(
                      product: _productsList[index],
                      favoriteProduct: () {},
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductScreen(product: _productsList[index]),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: _productsList.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                    mainAxisExtent: 290,
                    // childAspectRatio: 2,
                    // crossAxisSpacing: 20,
                    // mainAxisSpacing: 20,
                  ),
                );
              } else {
                return NoDataCenter();
              }
            },
          ),
        ),
      ),
    );
  }
}
