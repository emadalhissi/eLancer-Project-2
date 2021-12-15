import 'package:elancer_project_2/api/controllers/auth_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _currentPasswordEditingController;
  late TextEditingController _newPasswordEditingController;
  late TextEditingController _repeatPasswordEditingController;

  @override
  void initState() {
    super.initState();
    _currentPasswordEditingController = TextEditingController();
    _newPasswordEditingController = TextEditingController();
    _repeatPasswordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordEditingController.dispose();
    _newPasswordEditingController.dispose();
    _repeatPasswordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Change Password',
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
              TextField(
                controller: _currentPasswordEditingController,
                onChanged: (value) {
                  setState(() {
                    _currentPasswordEditingController;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Current Password',
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
              SizedBox(height: 15.h),
              TextField(
                controller: _newPasswordEditingController,
                onChanged: (value) {
                  setState(() {
                    _newPasswordEditingController;
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
              SizedBox(height: 15.h),
              TextField(
                controller: _repeatPasswordEditingController,
                onChanged: (value) {
                  setState(() {
                    _repeatPasswordEditingController;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Repeat Password',
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
                onPressed: runChangeButton()
                    ? () {
                        performChange();
                      }
                    : null,
                child: Text(
                  'Change',
                  style: TextStyle(
                    color: runChangeButton() ? Color(0xff0B0B0B) : Colors.white,
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

  Future<void> performChange() async {
    if (checkData()) {
      await change();
    }
  }

  bool checkData() {
    if (_currentPasswordEditingController.text.isNotEmpty &&
        _newPasswordEditingController.text.isNotEmpty &&
        _repeatPasswordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool runChangeButton() {
    if (_currentPasswordEditingController.text.isNotEmpty &&
        _newPasswordEditingController.text.isNotEmpty &&
        _repeatPasswordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> change() async {
    bool status = await AuthApiController().change(
      context,
      currentPassword: _currentPasswordEditingController.text,
      newPassword: _newPasswordEditingController.text,
      repeatPassword: _repeatPasswordEditingController.text,
    );
    if (status) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/settings_screen');
      });
    }
  }
}
