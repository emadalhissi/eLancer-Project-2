import 'package:elancer_project_2/api/controllers/product_api_controller.dart';
import 'package:elancer_project_2/models/api/images.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:elancer_project_2/widgets/big_product_image_container.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:elancer_project_2/widgets/slider_image.dart';
import 'package:elancer_project_2/widgets/small_product_image_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Product? product;
  late Future<Product?> _future;

  List<String> _images = <String>[
    'https://c4.wallpaperflare.com/wallpaper/480/897/69/room-blue-furniture-couch-wallpaper-preview.jpg',
    'https://c4.wallpaperflare.com/wallpaper/488/747/592/design-sofa-interior-pillow-living-room-hd-wallpaper-preview.jpg',
    'https://i.pinimg.com/originals/03/cf/6e/03cf6eb3721b97522d533403e629c373.jpg',
  ];

  final productDetails =
      'The Cloud Collection recalls the peaceful and close memories of Vietnamese souls for a slow way of life to enjoy in the midst of modern life. As the name implies, the collection is inspired by rattan materi.';

  late PageController _pageController;
  bool _isPressed = false;

  int _currentPage = 0;
  int _image1 = 0;
  int _image2 = 1;
  int _image3 = 2;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _future = ProductApiController().getProduct(id: widget.product.id);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
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
        actions: [
          Padding(
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
                  Icons.share,
                  color: Color(0xffB0B0B0),
                ),
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<Product?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
            product = snapshot.data;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, right: 5, left: 5),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              height: 300.h,
                              child: PageView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                controller: _pageController,
                                onPageChanged: (value) {
                                  setState(() {
                                    _currentPage = value;
                                  });
                                },
                                children: [
                                  BigProductImageContainer(
                                      image: product!.images[0].imageUrl),
                                  BigProductImageContainer(
                                      image: product!.images[1].imageUrl),
                                  BigProductImageContainer(
                                      image: product!.images[2].imageUrl),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 24,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _pageController.animateToPage(
                                          0,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      child: SmallProductImageContainer(
                                          image: product!.images[0].imageUrl),
                                    ),
                                    SizedBox(width: 15),
                                    InkWell(
                                      onTap: () {
                                        _pageController.animateToPage(
                                          1,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      child: SmallProductImageContainer(
                                          image: product!.images[1].imageUrl),
                                    ),
                                    SizedBox(width: 15),
                                    InkWell(
                                      onTap: () {
                                        _pageController.animateToPage(
                                          2,
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.bounceIn,
                                        );
                                      },
                                      child: SmallProductImageContainer(
                                          image: product!.images[2].imageUrl),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                                color: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 5.r,
                                blurRadius: 7.r,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(25.r),
                              topEnd: Radius.circular(25.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.product.nameEn,
                                        // overflow: TextOverflow.fade,
                                        // maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff0B0B0B),
                                        ),
                                      ),
                                    ),
                                    Container(
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
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              _isPressed
                                                  ? _isPressed = false
                                                  : _isPressed = true;
                                            },
                                          );
                                        },
                                        splashRadius: 1,
                                        icon: Icon(
                                          Icons.favorite,
                                          color: _isPressed
                                              ? Colors.red
                                              : Color(0xffB0B0B0),
                                          size: 25,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  '\$${widget.product.price}',
                                  style: TextStyle(
                                    color: Color(0xffFFCA27),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18.sp,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  'Product Details',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff0B0B0B),
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  widget.product.infoEn,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff636363),
                                  ),
                                ),
                                // SizedBox(height: 65.h),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO: add navigator to cart screen
                                  },
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(
                                      color: Color(0xff0B0B0B),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffFFCA27),
                                    minimumSize: Size(327.w, 44.h),
                                    shadowColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(
                                              15.r),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return NoDataCenter();
          }
        },
      ),
    );
  }
}
