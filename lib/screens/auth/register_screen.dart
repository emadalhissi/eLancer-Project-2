import 'package:elancer_project_2/widgets/input_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String dropDownValue = 'Gaza';
  var items = [
    'Gaza',
    'Deir Al-Balah',
    'Khanyounis',
    'Al Nosyrat',
    'Al Borayj',
    'Al Mghazi',
    'Rafah',
    'Al Zwayda',
    'Jbalya',
    'Beit Lahya',
    'Biet Hanoon'
  ];

  bool checkBoxValue = false;

  List gender = [];

  late TextEditingController _nameEditingController;
  late TextEditingController _mobileEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    super.initState();
    _nameEditingController = TextEditingController();
    _mobileEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
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
                      'Sign Up',
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
                      'Name',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _nameEditingController,
                      hintText: 'Full Name',
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
                      'Mobile',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _mobileEditingController,
                      hintText: 'Mobile Number',
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
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    InputTextField(
                      controller: _passwordEditingController,
                      hintText: 'Password',
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
                      'Gender',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // InputTextField(
                    //   controller: _passwordEditingController,
                    //   hintText: 'Gender',
                    //   obscure: true,
                    //   hasIcon: true,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _passwordEditingController;
                    //     });
                    //   },
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: checkBoxValue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxValue = value!;
                                });
                              },
                            ),
                            Text('Male'),
                          ],
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Checkbox(
                              value: checkBoxValue,
                              onChanged: (value) {
                                setState(() {
                                  checkBoxValue = value!;
                                });
                              },
                            ),
                            Text('Female'),
                          ],
                        ),
                        Spacer(),
                      ],
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
                      'City',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Color(0xff636363),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // InputTextField(
                    //   controller: _passwordEditingController,
                    //   hintText: 'City',
                    //   obscure: true,
                    //   hasIcon: true,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _passwordEditingController;
                    //     });
                    //   },
                    // ),
                    DropdownButton(
                      value: dropDownValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropDownValue = newValue!;
                        });
                      },
                      isExpanded: true,
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 24.h),
              Spacer(),
              ElevatedButton(
                onPressed: runSingInButton()
                    ? () {
                        performLogin();
                      }
                    : null,
                child: Text(
                  'Sign Up',
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text(
              //       'Already A User? ',
              //       style: TextStyle(
              //         color: Color(0xff636363),
              //         fontSize: 12.sp,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         Future.delayed(Duration(seconds: 1), () {
              //           Navigator.pushNamed(context, '/login_screen');
              //         });
              //       },
              //       child: Text(
              //         'Login',
              //         style: TextStyle(
              //           color: Color(0xffFFCA27),
              //           fontWeight: FontWeight.w500,
              //           fontSize: 14.sp,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void performLogin() {
    if (checkData()) {
      login();
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

  bool runSingInButton() {
    if (_nameEditingController.text.isNotEmpty &&
        _mobileEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void login() {
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/');
    });
  }
}
