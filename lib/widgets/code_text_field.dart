import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeTextField extends StatelessWidget {
  const CodeTextField({
    Key? key,
    required this.textEditingController,
    required this.onChanged,
    required this.focusNode,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final void Function(String value) onChanged;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.h,
      child: TextField(
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        controller: textEditingController,
        focusNode: focusNode,
        cursorColor: Colors.grey,
        style: TextStyle(
          color: Color(0xff0B0B0B),
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
        decoration: InputDecoration(
          counterText: '',
          enabledBorder: outlineBorder(borderColor: Color(0xffB0B0B0)),
          focusedBorder: outlineBorder(borderColor: Color(0xffB0B0B0)),
          // errorBorder: outlineBorder(borderColor: Colors.red),
        ),
      ),
    );
  }

  OutlineInputBorder outlineBorder({
    Color borderColor = Colors.grey,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.r),
      borderSide: BorderSide(
        width: 1,
        color: borderColor,
      ),
    );
  }
}
