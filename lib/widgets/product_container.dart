import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductContainer extends StatefulWidget {
  const ProductContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductContainer> createState() => _ProductContainerState();
}

class _ProductContainerState extends State<ProductContainer> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
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
                    // color: Colors.red,
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://smart-store.mr-dev.tech/storage/products/1638441397__product_image_1.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: Text(
                      'Table deskmmm',
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
                      'Tulip chair Table Tulip chair TableTulip chair TableTulip chair TableTulip chair Table',
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Text(
                        '\$61',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: Color(0xffFFCA27),
                        ),
                      ),
                      Spacer(),
                      Text(
                        '4.9',
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
                          color: _isPressed ? Colors.red : Color(0xffB0B0B0),
                          size: 20,
                        ),
                        onTap: () {
                          setState(
                            () {
                              _isPressed
                                  ? _isPressed = false
                                  : _isPressed = true;
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
  }
}
