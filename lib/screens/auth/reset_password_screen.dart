import 'package:elancer_project_2/api/controllers/auth_api_controller.dart';
import 'package:elancer_project_2/widgets/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    Key? key,
    required this.mobile,
  }) : super(key: key);

  final String mobile;

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController _mobileEditingController;
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;
  late TextEditingController _passwordEditingController;
  late TextEditingController _passwordConfirmationEditingController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  @override
  void initState() {
    super.initState();
    _mobileEditingController = TextEditingController(text: widget.mobile);
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _passwordEditingController = TextEditingController();
    _passwordConfirmationEditingController = TextEditingController();

    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _mobileEditingController.dispose();
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
    _passwordEditingController.dispose();
    _passwordConfirmationEditingController.dispose();

    _firstFocusNode.dispose();
    _secondFocusNode.dispose();
    _thirdFocusNode.dispose();
    _fourthFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.h,
          left: 24.w,
          right: 24.w,
          bottom: 44.h,
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                height: 44.h,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        // icon: Icon(
                        //   Icons.arrow_back_ios,
                        //   color: Color(0xffB0B0B0),
                        //   size: 24,
                        // ),
                        icon: Image(
                          image: AssetImage('images/left_arrow.png'),
                          width: 10.w,
                          height: 15.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Spacer(flex: 1),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Enter mobile number, reset code and new password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff636363),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 50.h),
              TextField(
                controller: _mobileEditingController,
                onChanged: (value) {
                  setState(() {
                    _mobileEditingController;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
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
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff636363), width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  labelStyle: TextStyle(
                    color: const Color(0xffA1A1A1),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  // Spacer(),
                  CodeTextField(
                    textEditingController: _firstCodeTextController,
                    focusNode: _firstFocusNode,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _secondFocusNode.requestFocus();
                      }
                    },
                  ),
                  // SizedBox(width: 16.w),
                  Spacer(),
                  CodeTextField(
                    textEditingController: _secondCodeTextController,
                    focusNode: _secondFocusNode,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _thirdFocusNode.requestFocus();
                      } else {
                        _firstFocusNode.requestFocus();
                      }
                    },
                  ),
                  // SizedBox(width: 16.w),
                  Spacer(),
                  CodeTextField(
                    textEditingController: _thirdCodeTextController,
                    focusNode: _thirdFocusNode,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _fourthFocusNode.requestFocus();
                      } else {
                        _secondFocusNode.requestFocus();
                      }
                    },
                  ),
                  // SizedBox(width: 16.w),
                  Spacer(),
                  CodeTextField(
                    textEditingController: _fourthCodeTextController,
                    focusNode: _fourthFocusNode,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        _thirdFocusNode.requestFocus();
                      }
                    },
                  ),
                  // Spacer(),
                ],
              ),
              SizedBox(height: 16.h),
              TextField(
                obscureText: true,
                controller: _passwordEditingController,
                onChanged: (value) {
                  setState(() {
                    _passwordEditingController;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'New Password',
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
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff636363), width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  labelStyle: TextStyle(
                    color: const Color(0xffA1A1A1),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                obscureText: true,
                controller: _passwordConfirmationEditingController,
                onChanged: (value) {
                  setState(() {
                    _passwordConfirmationEditingController;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Password Confirmation',
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
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff636363), width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  labelStyle: TextStyle(
                    color: const Color(0xffA1A1A1),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: runResetButton()
                    ? () {
                  performReset();
                }
                    : null,
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: runResetButton() ? Color(0xff0B0B0B) : Colors.white,
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
                    borderRadius: BorderRadiusDirectional.circular(15.r),
                  ),
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  void performReset() {
    if (checkData()) {
      reset();
    }
  }

  bool checkData() {
    if (_mobileEditingController.text.isNotEmpty &&
        _firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty &&
        _passwordConfirmationEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  String setCode() {
    String code = _firstCodeTextController.text +
        _secondCodeTextController.text +
        _thirdCodeTextController.text +
        _fourthCodeTextController.text;
    return code;
  }

  bool runResetButton() {
    if (_mobileEditingController.text.isNotEmpty &&
        _firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty &&
        _passwordConfirmationEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> reset() async {
    bool status = await AuthApiController().reset(context,
        mobile: _mobileEditingController.text,
        code: setCode(),
        password: _passwordEditingController.text,
        passwordConfirmation: _passwordConfirmationEditingController.text);
    if (status) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/login_screen');
      });
    }
  }
}
