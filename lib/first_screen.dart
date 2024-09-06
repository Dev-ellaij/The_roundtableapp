import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ijeoma_og/youtube_screen.dart';
import 'package:lottie/lottie.dart';

// ignore: use_key_in_widget_constructors
class VideoListScreen extends StatelessWidget {
  final List<Map<String, String>> videoList = [
    {'title': 'The Roundtable Community', 'videoId': 'BVT6IS1Xnek'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'The Roundtable Community',
          style: TextStyle(
            fontFamily: 'NeueMachina',
            fontWeight: FontWeight.w100,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 300.h,
                width: 300.w,
                child: Lottie.asset(
                  'assets/animation/community.json',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          YouTubeScreen(videoId: videoList[0]['videoId']!),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.w,
                    vertical: 10.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      'assets/animation/community.json',
                      height: 30.h,
                      width: 30.w,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Click Here',
                      style: TextStyle(
                        fontFamily: 'NeueMachina',
                        fontWeight: FontWeight.w200,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
