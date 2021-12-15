import 'package:elancer_project_2/api/controllers/favorite_products_api_controller.dart';
import 'package:elancer_project_2/get/favorite_getx_controller.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:elancer_project_2/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    Key? key,
    required this.product,
    required this.favoriteProduct,
  }) : super(key: key);

  final Product product;
  final void Function() favoriteProduct;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductScreen(
                product: product,
                // product: ,
              ),
            ));
      },
      child: Padding(
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
                      // color: Colors.red,
                      width: 100.w,
                      height: 100.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            // 'https://smart-store.mr-dev.tech/storage/products/1638441397__product_image_1.jpg',
                            // widget.imageUrl,
                            product.imageUrl,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: Text(
                        // widget.title,
                        product.nameEn,
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
                        // widget.description,
                        product.infoEn,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Text(
                          // '\$${widget.price}',
                          '\$${product.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: Color(0xffFFCA27),
                          ),
                        ),
                        Spacer(),
                        Text(
                          // '${widget.overallRate}',
                          '${product.overalRate}',
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
                            color: FavoriteProductsGetXController.to.isFavorite(product.id)
                                ? Colors.red
                                : Color(0xffB0B0B0),
                            size: 20,
                          ),
                          onTap: favoriteProduct,
                        ),
                        SizedBox(height: 10.h),
                        const InkWell(
                          child: Icon(
                            Icons.add_shopping_cart_sharp,
                            size: 20,
                            color: Color(0xffB0B0B0),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        const InkWell(
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
      ),
    );
  }
}
