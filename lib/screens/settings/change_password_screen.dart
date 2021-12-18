import 'package:elancer_project_2/api/controllers/auth_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.changePasswordScreen_screenMainTitle,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        toolbarHeight: 80.h,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 90.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Container(
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
              icon: Icon(
                Icons.arrow_back_ios_sharp,
                color: Color(0xffB0B0B0),
              ),
            ),
          ),
        ),
      ),
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
              TextField(
                controller: _currentPasswordEditingController,
                onChanged: (value) {
                  setState(() {
                    _currentPasswordEditingController;
                  });
                },
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.changePasswordScreen_currentPassword,
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
                  hintText: AppLocalizations.of(context)!.changePasswordScreen_newPassword,
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
                  hintText: AppLocalizations.of(context)!.changePasswordScreen_repeatPassword,
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
                  AppLocalizations.of(context)!.changePasswordScreen_change,
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
