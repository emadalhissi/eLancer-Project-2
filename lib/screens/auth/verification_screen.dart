import 'package:elancer_project_2/widgets/code_text_field.dart';
import 'package:elancer_project_2/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController _firstCodeTextController;
  late TextEditingController _secondCodeTextController;
  late TextEditingController _thirdCodeTextController;
  late TextEditingController _fourthCodeTextController;

  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;
  late FocusNode _fourthFocusNode;

  @override
  void initState() {
    super.initState();
    _firstCodeTextController = TextEditingController();
    _secondCodeTextController = TextEditingController();
    _thirdCodeTextController = TextEditingController();
    _fourthCodeTextController = TextEditingController();
    _firstFocusNode = FocusNode();
    _secondFocusNode = FocusNode();
    _thirdFocusNode = FocusNode();
    _fourthFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _firstCodeTextController.dispose();
    _secondCodeTextController.dispose();
    _thirdCodeTextController.dispose();
    _fourthCodeTextController.dispose();
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
                      'Verification',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
                ),
              ),
              SizedBox(height: 50.h),
              Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Center(
                  child: Text(
                    'We have sent the verification code to your mobile, please check your messages to confirm your account.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff636363),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.h),
              Row(
                children: [
                  Spacer(),
                  CodeTextField(
                    textEditingController: _firstCodeTextController,
                    focusNode: _firstFocusNode,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _secondFocusNode.requestFocus();
                      }
                    },
                  ),
                  SizedBox(width: 16.w),
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
                  SizedBox(width: 16.w),
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
                  SizedBox(width: 16.w),
                  CodeTextField(
                    textEditingController: _fourthCodeTextController,
                    focusNode: _fourthFocusNode,
                    onChanged: (value) {
                      if (value.isEmpty) {
                        _thirdFocusNode.requestFocus();
                      }
                    },
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  // TODO: SEND CODE AGAIN
                },
                child: Text(
                  'Resend another code',
                  style: TextStyle(
                    color: Color(0xff2D9CDB),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: runSingInButton()
                    ? () {
                        goToLogin();
                      }
                    : null,
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: runSingInButton() ? Color(0xff0B0B0B) : Colors.white,
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

  void performGoToLogin() {
    // if (checkData()) {
    // TODO: check code with API
    //   login();
    // }
  }

  bool runSingInButton() {
    if (_firstCodeTextController.text.isNotEmpty &&
        _secondCodeTextController.text.isNotEmpty &&
        _thirdCodeTextController.text.isNotEmpty &&
        _fourthCodeTextController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void goToLogin() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/login_screen');
    });
  }
}
