import 'package:elancer_project_2/api/controllers/auth_api_controller.dart';
import 'package:elancer_project_2/screens/auth/reset_password_screen.dart';
import 'package:elancer_project_2/widgets/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController _mobileEditingController;

  @override
  void initState() {
    super.initState();
    _mobileEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileEditingController.dispose();
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
                      'Forget Password',
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
                    'Enter your mobile number, to send password reset code.',
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
              Spacer(),
              ElevatedButton(
                onPressed: runNextButton()
                    ? () {
                        performForget();
                      }
                    : null,
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: runNextButton() ? Color(0xff0B0B0B) : Colors.white,
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

  Future<void> performForget() async {
    if (checkData()) {
      await forget();
    }
  }

  bool checkData() {
    if (_mobileEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool runNextButton() {
    if (_mobileEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> forget() async {
    bool status = await AuthApiController().forget(
      context,
      mobile: _mobileEditingController.text,
    );
    if (status) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPasswordScreen(
                mobile: _mobileEditingController.text,
              ),
            ));
      });
    }
  }
}
