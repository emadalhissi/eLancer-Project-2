import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingContent extends StatelessWidget {
  const OutBoardingContent({
    Key? key,
    required this.imageName,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String imageName;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 149.h,
          child: Container(
            margin: EdgeInsets.only(left: 24.w, right: 24.w),
            width: 327.w,
            height: 232.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('images/$imageName'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          top: 413.h,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 37.w, right: 37.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff0B0B0B),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xffB0B0B0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
