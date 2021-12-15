import 'package:elancer_project_2/api/controllers/auth_api_controller.dart';
import 'package:elancer_project_2/api/controllers/city_api_controller.dart';
import 'package:elancer_project_2/models/api/city.dart';
import 'package:elancer_project_2/models/api/user.dart';
import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:elancer_project_2/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late TextEditingController _nameEditingController;
  late TextEditingController _mobileEditingController;
  late TextEditingController _passwordEditingController;

  String _gender = 'M';

  int cityId = 1;

  List<City> _city = <City>[];
  late Future<List<City>> _future;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _mobileEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();

    _future = CityApiController().getCity();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
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
                      AppLocalizations.of(context)!
                          .registerScreen_screenMainTitle,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(flex: 2),
                  ],
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
                      AppLocalizations.of(context)!
                          .registerScreen_textField1_label,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _nameEditingController,
                      hintText: AppLocalizations.of(context)!
                          .registerScreen_textField1_label,
                      hasIcon: false,
                      onChanged: (value) {
                        setState(() {
                          _nameEditingController;
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
                      AppLocalizations.of(context)!
                          .registerScreen_textField2_label,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _mobileEditingController,
                      hintText: AppLocalizations.of(context)!
                          .registerScreen_textField2_hint,
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
                      AppLocalizations.of(context)!
                          .registerScreen_textField3_label,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _passwordEditingController,
                      hintText: AppLocalizations.of(context)!
                          .registerScreen_textField3_hint,
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
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.registerScreen_genderTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: RadioListTile<String>(
                              title: Text(
                                AppLocalizations.of(context)!
                                    .registerScreen_genderMale,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Color(0xff636363),
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                              value: 'M',
                              groupValue: _gender,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    _gender = value;
                                  });
                                }
                              }),
                        ),
                        Expanded(
                          child: RadioListTile<String>(
                              title: Text(
                                AppLocalizations.of(context)!
                                    .registerScreen_genderFemale,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Color(0xff636363),
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                              value: 'F',
                              groupValue: _gender,
                              onChanged: (String? value) {
                                if (value != null) {
                                  setState(() {
                                    _gender = value;
                                  });
                                }
                              }),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Container(                                         // City Container
                color: Colors.white,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.registerScreen_cityTitle,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    FutureBuilder<List<City>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          _city = snapshot.data ?? [];
                          return DropdownButton(
                            value: cityId,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: _city.map((e) {
                              return DropdownMenuItem(
                                child: Text(SharedPreferencesController().checkLanguage == 'en' ? e.nameEn : e.nameAr),
                                value: e.id,
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              setState(() {
                                cityId = newValue!;
                              });
                            },
                            isExpanded: true,
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: runRegisterButton()
                    ? () {
                        performRegister();
                      }
                    : null,
                child: Text(
                  AppLocalizations.of(context)!.registerScreen_signUpButton,
                  style: TextStyle(
                    color:
                        runRegisterButton() ? Color(0xff0B0B0B) : Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }

  void performRegister() {
    if (checkData()) {
      register();
    }
  }

  bool checkData() {
    if (_nameEditingController.text.isNotEmpty &&
        _mobileEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool runRegisterButton() {
    if (_nameEditingController.text.isNotEmpty &&
        _mobileEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> register() async {
    bool status = await AuthApiController().register(context, user: user);
    if (status) {
      SharedPreferencesController().save(user: user);
      print(status);
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/verification_screen');
      });
    }
  }

  User get user {
    User user = User();
    user.name = _nameEditingController.text;
    user.mobile = _mobileEditingController.text;
    user.password = _passwordEditingController.text;
    user.gender = _gender;
    user.cityId = cityId;
    user.city = city;
    return user;
  }

  City get city {
    City city = City();
    city.nameEn = _city[cityId-1].nameEn;
    city.nameAr = _city[cityId-1].nameAr;
    return city;
  }
}
