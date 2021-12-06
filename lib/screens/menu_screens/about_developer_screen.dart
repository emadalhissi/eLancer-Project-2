import 'package:elancer_project_2/widgets/about_developer_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDeveloperScreen extends StatefulWidget {
  const AboutDeveloperScreen({Key? key}) : super(key: key);

  @override
  _AboutDeveloperScreenState createState() => _AboutDeveloperScreenState();
}

class _AboutDeveloperScreenState extends State<AboutDeveloperScreen> {
  final String _facebookUrl = 'https://www.facebook.com/EmadAlhissi/';
  final String _instagramUrl = 'https://www.instagram.com/EmadAlhissi/';
  final String _whatsAppUrl = 'https://wa.me/972599680798';
  final String _youTubeUrl =
      'https://www.youtube.com/channel/UCjB_UqtT5lYVGqKTQZ-qhgw';
  final String _phoneNumber = 'tel:+972599680798';
  final String _email = 'mailto:emadalhissi@gmail.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: Colors.transparent,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 55.r,
                        backgroundColor: Color(0xff0c6fb8),
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundColor: Color(0xffFFCA27),
                          child: CircleAvatar(
                            radius: 45.r,
                            backgroundImage: AssetImage('images/my_photo.jpg'),
                          ),
                        ),
                      ),
                      SizedBox(width: 30.w),
                      Column(
                        children: [
                          Text(
                            'Emad Alhissi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 21.sp,
                              letterSpacing: 1,
                              fontFamily: 'Tajawal',
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Text(
                            'Mobile Developer',
                            style: TextStyle(
                              // fontStyle: FontStyle.normal,
                              fontSize: 16.sp,
                              color: Colors.blueGrey,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              height: 300.h,
              decoration: BoxDecoration(
                color: Color(0xffFFCA27),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.r),
                  bottomRight: Radius.circular(50.r),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AboutDeveloperListTile(
                        icon: Icons.phone_android_outlined,
                        title: 'Phone',
                        subTitle: '00972599680798',
                        buttonText: 'Call Now',
                        launchUrl: _phoneNumber,
                      ),
                      AboutDeveloperListTile(
                        icon: Icons.email,
                        title: 'Email',
                        subTitle: 'emadalhissi@gmail.com',
                        buttonText: 'Send Email',
                        launchUrl: _email,
                      ),
                      AboutDeveloperListTile(
                        icon: Icons.location_on_sharp,
                        title: 'Address',
                        subTitle: 'Gaza, Palestine',
                      ),
                      AboutDeveloperListTile(
                        icon: Icons.date_range,
                        title: 'D.O.B',
                        subTitle: '22-01-2021',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 24.w),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 150.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 33.r,
                    child: IconButton(
                      onPressed: () => launchURL(_facebookUrl),
                      icon: Image(
                        image: AssetImage('images/facebook-logo.png'),
                        fit: BoxFit.fill,
                        width: 50.w,
                        height: 50.h,
                      ),
                      iconSize: 50.w,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.w),
                  CircleAvatar(
                    radius: 33.r,
                    child: IconButton(
                      onPressed: () => launchURL(_instagramUrl),
                      icon: Image(
                        image: AssetImage('images/instagram.png'),
                        fit: BoxFit.fill,
                        width: 50.w,
                        height: 50.r,
                      ),
                      iconSize: 50.w,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.w),
                  CircleAvatar(
                    radius: 35.r,
                    child: IconButton(
                      onPressed: () => launchURL(_whatsAppUrl),
                      icon: Image(
                        image: AssetImage('images/whatsapp.png'),
                        fit: BoxFit.fill,
                        width: 60.w,
                        height: 60.h,
                      ),
                      iconSize: 60.w,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(width: 10.w),
                  CircleAvatar(
                    radius: 35,
                    child: IconButton(
                      onPressed: () => launchURL(_youTubeUrl),
                      icon: Image(
                        image: AssetImage('images/youtube.png'),
                        fit: BoxFit.fill,
                        width: 55.w,
                        height: 55.h,
                      ),
                      iconSize: 55.w,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch!';
}
