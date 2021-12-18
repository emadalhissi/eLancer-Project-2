import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), (){
      // String route = SharedPreferencesController().loggedIn ? '/main_screen' : '/login_screen';
      String route;
      if(SharedPreferencesController().checkFirstVisit == true) {
        route = '/out_boarding_screen';
      } else if(SharedPreferencesController().loggedIn) {
        route = '/main_screen';
      } else {
        route = '/login_screen';
      }
      Navigator.pushReplacementNamed(context, route);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFFCA27),
              Color(0xffFFCA27),
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Bronea",
            style: TextStyle(
              color: Colors.black,
              fontSize: 50.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
