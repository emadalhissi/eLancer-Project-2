import 'package:elancer_project_2/api/controllers/auth_api_controller.dart';
import 'package:elancer_project_2/shared_preferences/shared_preferences_controller.dart';
import 'package:elancer_project_2/widgets/menu_screen_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final privacyPolicyLink = 'https://smart-store.mr-dev.tech/privacy-policy';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_profile,
                icon: Icons.person,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/profile_screen',
                  );
                },
              ),
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_notifications,
                icon: Icons.notifications,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/notifications_screen',
                  );
                },
              ),
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_faq,
                icon: Icons.help,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/faq_screen',
                  );
                },
              ),
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_privacyPolicy,
                icon: Icons.privacy_tip,
                onTab: () {
                  launchURL(privacyPolicyLink);
                },
              ),
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_contactUs,
                icon: Icons.local_phone,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/contact_screen',
                  );
                },
              ),
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_settings,
                icon: Icons.settings,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/settings_screen',
                  );
                },
              ),
              Divider(
                color: const Color(0xffB0B0B0),
                thickness: 1,
                indent: 24,
                endIndent: 24,
                height: 20.h,
              ),
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_aboutDeveloper,
                icon: Icons.info,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/about_developer_screen',
                  );
                },
              ),
              Divider(
                color: const Color(0xffB0B0B0),
                thickness: 1,
                indent: 24,
                endIndent: 24,
                height: 20.h,
              ),
              MenuScreenListTile(
                title: AppLocalizations.of(context)!.menuScreen_logout,
                icon: Icons.logout,
                onTab: () {
                  logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch!';

  Future<void> logout() async {
    bool status = await AuthApiController().logout();
    if (status) {
      SharedPreferencesController().logout();
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacementNamed(context, '/login_screen');
      });
    }
  }
}
