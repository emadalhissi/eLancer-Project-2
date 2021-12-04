import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigProductImageContainer extends StatelessWidget {
  const BigProductImageContainer({
    Key? key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300.h,
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