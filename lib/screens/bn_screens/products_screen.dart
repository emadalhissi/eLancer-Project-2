import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:elancer_project_2/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: GridView.builder(
          itemBuilder: (BuildContext context, index) {
            // return ProductContainer();
            return NoDataCenter();
          },
          itemCount: 10,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
            mainAxisExtent: 290,
            // childAspectRatio: 2,
            // crossAxisSpacing: 20,
            // mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
