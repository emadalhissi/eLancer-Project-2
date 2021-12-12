import 'package:elancer_project_2/Providers/lang_provider.dart';
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
import 'package:elancer_project_2/screens/menu_screens/faq_screen.dart';
import 'package:elancer_project_2/screens/menu_screens/notifications_screen.dart';
import 'package:elancer_project_2/screens/menu_screens/profile_screen.dart';
import 'package:elancer_project_2/screens/menu_screens/settings_screen.dart';
import 'package:elancer_project_2/screens/outboarding/out_boarding_screen.dart';
import 'package:elancer_project_2/screens/product_screen.dart';
import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; //IMPORTANT
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
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
      builder: () => RestartWidget(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<LangProvider>(
              create: (context) => LangProvider(),
            ),
          ],
          child: const MyMaterialApp(),
        ),
      ),
    );
  }
}

class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/main_screen',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
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
        '/profile_screen': (context) => const ProfileScreen(),
        '/notifications_screen': (context) => const NotificationsScreen(),
        '/faq_screen': (context) => const FAQScreen(),
        '/settings_screen': (context) => const SettingsScreen(),
        '/about_developer_screen': (context) => const AboutDeveloperScreen(),
        //-------------------------------OTHERS-------------------------------------
        '/forget_password_screen': (context) => const ForgetPasswordScreen(),
        '/product_screen': (context) => const ProductScreen(),
      },
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: Locale(Provider.of<LangProvider>(context).lang),
    );
  }
}

// FOR RESTARTING APP
// CALL IT FROM ANYWHERE USING => RestartWidget.restartApp(context)

class RestartWidget extends StatefulWidget {
  const RestartWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
