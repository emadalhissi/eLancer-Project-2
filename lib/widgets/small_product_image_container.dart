import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallProductImageContainer extends StatelessWidget {
  const SmallProductImageContainer({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}