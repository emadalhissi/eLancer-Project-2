import 'package:elancer_project_2/api/controllers/auth_api_controller.dart';
import 'package:elancer_project_2/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _mobileEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    super.initState();
    _mobileEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _mobileEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(
          top: 68.h,
          left: 24.w,
          right: 24.w,
          bottom: 54.h,
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                height: 44.h,
                child: Text(
                  AppLocalizations.of(context)!.loginScreen_screenMainTitle,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.loginScreen_textField1_label,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _mobileEditingController,
                      hintText: AppLocalizations.of(context)!.loginScreen_textField1_hint,
                      obscure: false,
                      hasIcon: false,
                      onChanged: (value) {
                        setState(() {
                          _mobileEditingController;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.loginScreen_textField2_label,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _passwordEditingController,
                      hintText: AppLocalizations.of(context)!.loginScreen_textField2_hint,
                      obscure: true,
                      hasIcon: true,
                      onChanged: (value) {
                        setState(() {
                          _passwordEditingController;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.loginScreen_forgotPasswordQuestion,
                    style: TextStyle(
                      color: Color(0xff2D9CDB),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  onPressed: () {
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.pushNamed(context, '/forget_password_screen');
                    });
                  },
                ),
              ),
              SizedBox(height: 24.h),
              ElevatedButton(
                onPressed: runSingInButton()
                    ? () async {
                        await performLogin();
                      }
                    : null,
                child: Text(
                  AppLocalizations.of(context)!.loginScreen_singInButton,
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
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.loginScreen_haveAnAccountQuestion,
                    style: TextStyle(
                      color: Color(0xff636363),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.pushNamed(context, '/register_screen');
                      });
                    },
                    child: Text(
                      AppLocalizations.of(context)!.loginScreen_signUpButton,
                      style: TextStyle(
                        color: Color(0xffFFCA27),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_mobileEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool runSingInButton() {
    if (_mobileEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    bool status = await AuthApiController().login(
      context,
      mobile: _mobileEditingController.text,
      password: _passwordEditingController.text,
    );
    if (status) {
      print("LOGIN");
      Future.delayed(const Duration(seconds: 1), () {
        //TODO: check API info for user login
        Navigator.pushReplacementNamed(context, '/main_screen');
      });
    }
  }
}
