import 'package:elancer_project_2/widgets/out%20boarding%20widgets/out_boarding_content.dart';
import 'package:elancer_project_2/widgets/out%20boarding%20widgets/out_boarding_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  _OutBoardingScreenState createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: 422.w,
              minHeight: 0,
              maxHeight: 600.h,
            ),
            child: PageView(
              // scrollBehavior: ScrollPhysics().,
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              onPageChanged: (value) {
                setState(
                  () {
                    _currentPage = value;
                  },
                );
              },
              children: [
                OutBoardingContent(
                  imageName: 'ob_1.png',
                  title: AppLocalizations.of(context)!.outBoardingScreen_page1_title,
                  subTitle: AppLocalizations.of(context)!.outBoardingScreen_page1_subTitle,
                ),
                OutBoardingContent(
                  imageName: 'ob_2.png',
                  title: AppLocalizations.of(context)!.outBoardingScreen_page2_title,
                  subTitle: AppLocalizations.of(context)!.outBoardingScreen_page2_subTitle,
                ),
                OutBoardingContent(
                  imageName: 'ob_3.png',
                  title: AppLocalizations.of(context)!.outBoardingScreen_page3_title,
                  subTitle: AppLocalizations.of(context)!.outBoardingScreen_page3_subTitle,
                ),
                OutBoardingContent(
                  imageName: 'ob_4.png',
                  title: AppLocalizations.of(context)!.outBoardingScreen_page4_title,
                  subTitle: AppLocalizations.of(context)!.outBoardingScreen_page4_subTitle,
                ),
              ],
            ),
          ),
          // SizedBox(height: 120.h),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 39.w, right: 39.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutBoardingIndicator(
                  marginEnd: 4.w,
                  selected: _currentPage == 0,
                ),
                OutBoardingIndicator(
                  marginEnd: 4.w,
                  selected: _currentPage == 1,
                ),
                OutBoardingIndicator(
                  marginEnd: 4.w,
                  selected: _currentPage == 2,
                ),
                OutBoardingIndicator(
                  marginEnd: 4.w,
                  selected: _currentPage == 3,
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          ElevatedButton(
            onPressed: _currentPage == 3
                ? () {
                    Navigator.pushReplacementNamed(context, '/login_screen');
                  }
                : () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
            child: Text(
              AppLocalizations.of(context)!.outBoardingScreen_button,
              style: TextStyle(
                color: Color(0xff0B0B0B),
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xfff9a42f),
              minimumSize: Size(327.w, 44.h),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
