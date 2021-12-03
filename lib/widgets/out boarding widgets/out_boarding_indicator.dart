import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBoardingIndicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  const OutBoardingIndicator({
    Key? key,
    required this.marginEnd,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? const Color(0xffFFCA27) : const Color(0xffFFCA27).withOpacity(0.30),
        borderRadius: BorderRadius.circular(15.r),
      ),
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      height: 5.w,
      width: selected ? 15.w : 5.w,
    );
  }
}
