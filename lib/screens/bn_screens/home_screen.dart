import 'package:elancer_project_2/widgets/slider_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        top: 24.h,
        bottom: 0,
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 190.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New collection',
                  style: TextStyle(
                    color: Color(0xff0B0B0B),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: PageView(
                    physics: BouncingScrollPhysics(),
                    // clipBehavior: Clip.none,
                    // controller: _pageController,
                    padEnds: false,
                    controller: PageController(
                      viewportFraction: 0.9,
                      initialPage: 0,
                    ),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (value) {
                      setState(() {
                        _currentPage = value;
                      });
                    },
                    children: [
                      SliderImage(image: 'https://c4.wallpaperflare.com/wallpaper/480/897/69/room-blue-furniture-couch-wallpaper-preview.jpg'),
                      SliderImage(image: 'https://c4.wallpaperflare.com/wallpaper/488/747/592/design-sofa-interior-pillow-living-room-hd-wallpaper-preview.jpg'),
                      SliderImage(image: 'https://i.pinimg.com/originals/03/cf/6e/03cf6eb3721b97522d533403e629c373.jpg'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

