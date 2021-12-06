import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoDataCenter extends StatelessWidget {
  const NoDataCenter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            size: 85.w,
            color: Colors.grey,
          ),
          Text(
            'NO DATA',
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
