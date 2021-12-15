import 'package:elancer_project_2/api/controllers/faq_api_controller.dart';
import 'package:elancer_project_2/models/api/faq.dart';
import 'package:elancer_project_2/widgets/no_data_center.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  _FAQScreenState createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<Faq> _faqList = <Faq>[];
  late Future<List<Faq>> _future;

  @override
  void initState() {
    super.initState();
    _future = FaqApiController().showFaq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FAQ',
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
          child: FutureBuilder<List<Faq>>(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                _faqList = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: _faqList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        width: MediaQuery.of(context).size.width,
                        height: 200.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5.r,
                              blurRadius: 7.r,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                _faqList[index].questionEn,
                                style: TextStyle(
                                  color: Color(0xff0B0B0B),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Divider(height: 30.h),
                              Text(
                                _faqList[index].answerEn,
                                style: TextStyle(
                                  color: Color(0xff636363),
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return NoDataCenter();
              }
            },
          ),
          // child: SingleChildScrollView(
          //   child: Column(
          //     children: [
          //       Padding(
          //         padding: const EdgeInsets.only(bottom: 16),
          //         child: Container(
          //           margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //           width: MediaQuery.of(context).size.width,
          //           height: 200.h,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(15.r),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(0.2),
          //                 spreadRadius: 5.r,
          //                 blurRadius: 7.r,
          //                 offset: Offset(0, 2), // changes position of shadow
          //               ),
          //             ],
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(16),
          //             child: Column(
          //               children: [
          //                 Text(
          //                   'Question',
          //                   style: TextStyle(
          //                     color: Color(0xff0B0B0B),
          //                     fontSize: 16.sp,
          //                     fontWeight: FontWeight.w600,
          //                   ),
          //                 ),
          //                 Divider(height: 30.h),
          //                 Text(
          //                   'Question Question QuestionQuestionQuestionQuestionQuestion QuestionQuestionQuestion',
          //                   style: TextStyle(
          //                     color: Color(0xff636363),
          //                     fontSize: 15.sp,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
