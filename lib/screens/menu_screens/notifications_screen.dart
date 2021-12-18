import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.notificationsScreen_screenMainTitle,
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
      body: NoDataCenter(),
    );
  }
}
