import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:elancer_project_2/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.transparent,
                child: Image(
                  image: SharedPreferencesController().getGender == 'M'
                      ? AssetImage('images/man.png')
                      : AssetImage('images/woman.png'),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 40.h),
              ProfileListTile(
                title: 'Name',
                subTitle: SharedPreferencesController().getName,
                icon: Icons.account_circle,
              ),
              SizedBox(height: 5.h),
              ProfileListTile(
                title: 'Mobile',
                subTitle: SharedPreferencesController().getMobile,
                icon: Icons.local_phone,
              ),
              SizedBox(height: 5.h),
              ProfileListTile(
                title: 'Gender',
                subTitle: SharedPreferencesController().getGender == 'M'
                    ? 'Male'
                    : 'Female',
                icon: Icons.person,
              ),
              SizedBox(height: 5.h),
              ProfileListTile(
                title: 'City',
                subTitle: SharedPreferencesController().checkLanguage == 'en'
                    ? SharedPreferencesController().getCityEn
                    : SharedPreferencesController().getCityAr,
                icon: Icons.my_location,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
