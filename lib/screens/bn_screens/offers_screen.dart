import 'package:elancer_project_2/api/controllers/offers_api_controller.dart';
import 'package:elancer_project_2/models/api/offer_product.dart';
import 'package:elancer_project_2/models/api/product.dart';
import 'package:elancer_project_2/screens/product_screen.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:elancer_project_2/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({Key? key}) : super(key: key);

  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<OfferProduct> _offersList = <OfferProduct>[];
  late Future<List<OfferProduct>> _future;

  @override
  void initState() {
    super.initState();
    _future = OffersApiController().showOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: FutureBuilder<List<OfferProduct>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              _offersList = snapshot.data ?? [];
              return GridView.builder(
                itemBuilder: (BuildContext context, index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) =>
                      //         ProductScreen(product: _offersList[index]),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
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
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 10.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          _offersList[index].imageUrl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  Expanded(
                                    child: Text(
                                      _offersList[index].nameEn,
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
                                      _offersList[index].infoEn,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Text(
                                        '\$${_offersList[index].originalPrice}  ',
                                        style: TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                      Text(
                                        '\$${_offersList[index].discountPrice}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                          color: Color(0xffFFCA27),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 16.h, horizontal: 8.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        child: Icon(
                                          Icons.favorite,
                                          // color: FavoriteProductsGetXController.to
                                          //     .isFavorite(product.id)
                                          //     ? Colors.red
                                          //     : Color(0xffB0B0B0),
                                          size: 20,
                                        ),
                                        // onTap: favoriteProduct,
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
                },
                itemCount: _offersList.length,
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
    );
  }
}
