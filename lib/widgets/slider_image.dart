import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderImage extends StatelessWidget {
  const SliderImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w, left: 8.w),
      child: Container(
        height: 144.h,
        width: 221.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
