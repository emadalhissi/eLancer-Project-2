import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatefulWidget {
  const InputTextField({
    Key? key,
    required this.controller,
    this.obscure = false,
    required this.hintText,
    required this.hasIcon,
    this.icon = Icons.visibility,
    required this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscure;
  final String hintText;
  final bool hasIcon;
  final IconData icon;
  final Function(String value) onChanged;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];

  bool _visibility = true;
  bool _showPassword = false;

  @override
  void initState() {
    super.initState();
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: _focusNodes[0],
      controller: widget.controller,
      onChanged: widget.onChanged,
      showCursor: true,
      obscureText: checkIcon() ? showPassword() : false,
      // obscuringCharacter: '*',

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xffB0B0B0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xffB0B0B0),
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        suffixIcon: widget.hasIcon
            ? IconButton(
                splashColor: Colors.transparent,
                color: _focusNodes[0].hasFocus
                    ? Color(0xff636363)
                    : Color(0xffB0B0B0),
                onPressed: () {
                  setState(() {
                    _visibility ? _visibility = false : _visibility = true;
                    _showPassword
                        ? _showPassword = false
                        : _showPassword = true;
                  });
                },
                icon: _visibility
                    ? Icon(widget.icon)
                    : Icon(Icons.visibility_off),
              )
            : null,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff636363), width: 1.w),
          borderRadius: BorderRadius.circular(15.r),
        ),
        labelStyle: TextStyle(
          color: const Color(0xffA1A1A1),
          fontWeight: FontWeight.bold,
          fontSize: 13.sp,
        ),
      ),
    );
  }

  bool checkIcon() {
    if (widget.hasIcon) {
      return true;
    } else {
      return false;
    }
  }

  bool showPassword() {
    if(_showPassword) {
      return false;
    } else {
      return true;
    }
  }

// bool check....
}
