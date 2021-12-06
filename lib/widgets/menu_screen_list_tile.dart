import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuScreenListTile extends StatelessWidget {
  const MenuScreenListTile({Key? key,
    required this.icon,
    required this.title,
    required this.onTab,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: ListTile(
        minLeadingWidth: 0,
        onTap: onTab,
        leading: Icon(icon, color: Color(0xff636363), size: 25,),
        contentPadding: EdgeInsetsDirectional.only(start: 24),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xff636363),
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
