import 'package:elancer_project_2/screens/auth/forget_password_screen.dart';
import 'package:elancer_project_2/screens/auth/register_screen.dart';
import 'package:elancer_project_2/screens/auth/verification_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/categories_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/favorites_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/home_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/menu_screen.dart';
import 'package:elancer_project_2/screens/bn_screens/products_screen.dart';
import 'package:elancer_project_2/screens/launch_screen.dart';
import 'package:elancer_project_2/screens/auth/login_screen.dart';
import 'package:elancer_project_2/screens/main_screen.dart';
import 'package:elancer_project_2/screens/menu_screens/about_developer_screen.dart';
import 'package:elancer_project_2/screens/outboarding/out_boarding_screen.dart';
import 'package:elancer_project_2/screens/product_screen.dart';
import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initSharedPreferences();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        theme: ThemeData(fontFamily: 'Montserrat'),
        debugShowCheckedModeBanner: false,
        initialRoute: '/login_screen',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        routes: {
          //-------------------------------START SCREENS-------------------------------------
          '/launch_screen': (context) => const LaunchScreen(),
          '/out_boarding_screen': (context) => const OutBoardingScreen(),
          '/login_screen': (context) => const LoginScreen(),
          '/register_screen': (context) => const RegisterScreen(),
          '/verification_screen': (context) => const VerificationScreen(),
          //-------------------------------MAIN SCREEN-------------------------------------
          '/main_screen': (context) => const MainScreen(),
          //-------------------------------BN SCREENS-------------------------------------
          '/home_screen': (context) => const HomeScreen(),
          '/favorites_screen': (context) => const FavoritesScreen(),
          '/products_screen': (context) => const ProductsScreen(),
          '/categories_screen': (context) => const CategoriesScreen(),
          '/menu_screen': (context) => const MenuScreen(),
          //-------------------------------MENU SCREENS-------------------------------------
          '/about_developer_screen': (context) => const AboutDeveloperScreen(),
          //-------------------------------OTHERS-------------------------------------
          '/forget_password_screen': (context) => const ForgetPasswordScreen(),
          '/product_screen': (context) => const ProductScreen(),
        },
        supportedLocales: const [
          Locale('ar'),
          Locale('en'),
        ],
        locale: Locale('en'),
      ),
    );
  }
}

