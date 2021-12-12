import 'package:elancer_project_2/Providers/lang_provider.dart';
import 'package:elancer_project_2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class _SettingsScreenState extends State<SettingsScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Divider(
                //   color: Colors.grey.shade800,
                //   thickness: 0.5,
                //   indent: 20,
                //   endIndent: 20,
                //   height: 20,
                // ),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Stack(
                              // overflow: Overflow.visible,
                              // clipBehavior: Clip.antiAlias,
                              children: [
                                // Positioned(
                                //   right: -40.0,
                                //   top: -40.0,
                                //   child: InkResponse(
                                //     onTap: () {
                                //       Navigator.of(context).pop();
                                //     },
                                //     child: CircleAvatar(
                                //       child: Icon(Icons.close),
                                //       backgroundColor: Colors.red,
                                //     ),
                                //   ),
                                // ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Choose Language'),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                      const Divider(
                                        height: 10,
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            child: Column(
                                              children: [
                                                const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'images/saudi_arabia_flag.png'),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  radius: 30,
                                                ),
                                                const SizedBox(height: 10),
                                                Text('Arabic'),
                                              ],
                                            ),
                                            // onTap: () => changeLang(),
                                            onTap: () {
                                              if (Provider.of<LangProvider>(
                                                          context,
                                                          listen: false)
                                                      .lang ==
                                                  'en') {
                                                Provider.of<LangProvider>(
                                                        context,
                                                        listen: false)
                                                    .changeLang();
                                                RestartWidget.restartApp(
                                                    context);
                                              }
                                            },
                                          ),
                                          // SizedBox(width: 30),
                                          InkWell(
                                            child: Column(
                                              children: [
                                                const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'images/usa_flag.png'),
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  radius: 30,
                                                ),
                                                const SizedBox(height: 10),
                                                Text('English'),
                                              ],
                                            ),
                                            // onTap: () => changeLang(),
                                            onTap: () {
                                              if (Provider.of<LangProvider>(
                                                          context,
                                                          listen: false)
                                                      .lang ==
                                                  'ar') {
                                                Provider.of<LangProvider>(
                                                        context,
                                                        listen: false)
                                                    .changeLang();
                                                RestartWidget.restartApp(
                                                    context);
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                      // Padding(
                                      //   padding: EdgeInsets.all(8.0),
                                      //   child: TextFormField(),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(8.0),
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.red.shade400,
                    // child: Icon(
                    //   Icons.language,
                    //   color: Colors.white,
                    //   size: 25,
                    // ),
                    backgroundImage: AssetImage(flag()),
                    radius: 25,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                  title: Text(
                    'Language',
                    style: TextStyle(
                      color: const Color(0xff636363),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image(
      //         image: AssetImage('images/settings.png'),
      //         width: 200,
      //         height: 200,
      //       ),
      //       SizedBox(height: 30),
      //       Text(
      //         'COMING SOON',
      //         style: TextStyle(
      //           color: Colors.grey.shade800,
      //           fontSize: 25,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  String flag() {
    if (Provider.of<LangProvider>(context, listen: false).lang == 'en') {
      return 'images/usa_flag.png';
    } else {
      return 'images/saudi_arabia_flag.png';
    }
  }
// void changeLang() {
//
//
//   Provider.of<LangProvider>(context, listen: false).changeLang();
// }

// void changeLang(String lang) async {
//   await SharedPreferencesController().setLanguage(language: lang);
//   Future.delayed(
//     const Duration(milliseconds: 500),
//     () {
//       Navigator.pushNamed(context, '/launch_screen');
//     },
//   );
// }
}

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
