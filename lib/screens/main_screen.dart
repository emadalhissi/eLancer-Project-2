import 'dart:ffi';

import 'package:elancer_project_2/models/bn_models/bn_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/categories_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/favorites_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/home_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/menu_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final List<BnScreen> _bnScreens = <BnScreen>[
      BnScreen(
          title: AppLocalizations.of(context)!.productsScreen_screenMainTitle,
          widget: const ProductsScreen()),
      BnScreen(
          title: AppLocalizations.of(context)!.categoriesScreen_screenMainTitle,
          widget: const CategoriesScreen()),
      BnScreen(
          title: AppLocalizations.of(context)!.homeScreen_screenMainTitle,
          widget: const HomeScreen()),
      BnScreen(
          title: AppLocalizations.of(context)!.favoritesScreen_screenMainTitle,
          widget: const FavoritesScreen()),
      BnScreen(
          title: AppLocalizations.of(context)!.menuScreen_screenMainTitle,
          widget: const MenuScreen()),
    ];
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.zero),
        leadingWidth: 0,
        backgroundColor: Color(0xffFFCA27),
        title: Padding(
          padding: EdgeInsetsDirectional.only(start: 20.w),
          child: Text(
            _bnScreens[_currentIndex].title,
            style: TextStyle(
              color: Color(0xff0B0B0B),
              fontSize: 24.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.r),
          ),
        ),
        toolbarHeight: 100.h,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 24.w),
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
                    // TODO: add search
                  });
                },
                splashRadius: 1,
                // icon: Icon(
                //   Icons.arrow_back_ios,
                //   color: Color(0xffB0B0B0),
                //   size: 24,
                // ),
                icon: Icon(Icons.search, color: Color(0xffB0B0B0)),
              ),
            ),
          ),
        ],
      ),
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          setState(
            () {
              _currentIndex = value;
            },
          );
        },
        currentIndex: _currentIndex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        // unselectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        elevation: 50,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.store,
              size: 26.h,
              color: Color(0xffB0B0B0),
            ),
            label: '',
            activeIcon: Icon(
              Icons.store,
              size: 26.h,
              color: Color(0xffFFCA27),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              size: 26.h,
              color: Color(0xffB0B0B0),
            ),
            label: '',
            activeIcon: Icon(
              Icons.category,
              size: 26.h,
              color: Color(0xffFFCA27),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 26.h,
              color: Color(0xffB0B0B0),
            ),
            label: '',
            activeIcon: Icon(
              Icons.home,
              size: 26.h,
              color: Color(0xffFFCA27),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 26.h,
              color: Color(0xffB0B0B0),
            ),
            label: '',
            activeIcon: Icon(
              Icons.favorite,
              size: 26.h,
              color: Color(0xffFFCA27),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 26.h,
              color: Color(0xffB0B0B0),
            ),
            label: '',
            activeIcon: Icon(
              Icons.menu,
              size: 26.h,
              color: Color(0xffFFCA27),
            ),
          ),
        ],
      ),
    );
  }
}
