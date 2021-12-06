import 'package:elancer_project_2/widgets/menu_screen_list_tile.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

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
                title: 'Profile',
                icon: Icons.person,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/profile_screen',
                  );
                },
              ),
              MenuScreenListTile(
                title: 'Notifications',
                icon: Icons.notifications,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/notifications_screen',
                  );
                },
              ),
              MenuScreenListTile(
                title: 'FAQ',
                icon: Icons.help,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/faq_screen',
                  );
                },
              ),
              MenuScreenListTile(
                title: 'Privacy Policy',
                icon: Icons.privacy_tip,
                onTab: () {
                  launchURL(privacyPolicyLink);
                },
              ),
              MenuScreenListTile(
                title: 'Settings',
                icon: Icons.settings,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/settings_screen',
                  );
                },
              ),
              Divider(
                color: Color(0xffB0B0B0),
                thickness: 1,
                indent: 24,
                endIndent: 24,
                height: 20.h,
              ),
              MenuScreenListTile(
                title: 'About Developer',
                icon: Icons.info,
                onTab: () {
                  Navigator.pushNamed(
                    context,
                    '/about_developer_screen',
                  );
                },
              ),
              Divider(
                color: Color(0xffB0B0B0),
                thickness: 1,
                indent: 24,
                endIndent: 24,
                height: 20.h,
              ),
              MenuScreenListTile(
                title: 'Logout',
                icon: Icons.logout,
                onTab: () {
                  Navigator.pushReplacementNamed(
                    context,
                    '/login_screen',
                    // TODO: add logout function
                  );
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
}
