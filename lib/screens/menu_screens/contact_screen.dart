import 'package:elancer_project_2/api/controllers/contact_api_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late TextEditingController _subjectEditingController;
  late TextEditingController _messageEditingController;

  @override
  void initState() {
    super.initState();
    _subjectEditingController = TextEditingController();
    _messageEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _subjectEditingController.dispose();
    _messageEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Contact Us',
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
          child: Column(
            children: [
              TextField(
                controller: _subjectEditingController,
                onChanged: (value) {
                  setState(() {
                    _subjectEditingController;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Subject',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffB0B0B0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffB0B0B0),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff636363), width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  labelStyle: TextStyle(
                    color: const Color(0xffA1A1A1),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              TextField(
                controller: _messageEditingController,
                onChanged: (value) {
                  setState(() {
                    _messageEditingController;
                  });
                },
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: 'Message',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xffB0B0B0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffB0B0B0),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff636363), width: 1.w),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  labelStyle: TextStyle(
                    color: const Color(0xffA1A1A1),
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: runSendButton()
                    ? () async {
                        await performSend();
                      }
                    : null,
                child: Text(
                  'Send',
                  style: TextStyle(
                    color: runSendButton() ? Color(0xff0B0B0B) : Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFFCA27),
                  minimumSize: Size(327.w, 44.h),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(15.r),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> performSend() async {
    if (checkData()) {
      await send();
    }
  }

  bool checkData() {
    if (_subjectEditingController.text.isNotEmpty &&
        _messageEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  bool runSendButton() {
    if (_subjectEditingController.text.isNotEmpty &&
        _messageEditingController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> send() async {
    bool status = await ContactApiController().contact(
      context,
      subject: _subjectEditingController.text,
      message: _messageEditingController.text,
    );
    if (status) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }
}
