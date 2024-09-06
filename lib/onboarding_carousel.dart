import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'lottie_screen.dart';

class OnboardingCarousel extends StatefulWidget {
  const OnboardingCarousel({super.key, required Center body});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingCarouselState createState() => _OnboardingCarouselState();
}

class _OnboardingCarouselState extends State<OnboardingCarousel> {
  int _currentIndex = 0;

  final List<String> images = [
    'assets/rountablegreenlogo.jpg',
    'assets/rountablegreenlogo.jpg',
    'assets/rountablegreenlogo.jpg',
  ];

  final List<String> titles = [
    "Welcome to The RoundTable, Not Your Average Conference",
    "Real Conversations. Real Connections.",
    "Real Growth. Convener: Kennedy Ekezie",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 400.0.h,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: images.map((image) {
              return Builder(
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        image,
                        height: 200.h,
                        width: 200.w,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        titles[images.indexOf(image)],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'NeueMachina',
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w200,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((image) {
              int index = images.indexOf(image);
              return Container(
                width: 8.0.w,
                height: 8.0.h,
                margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 2.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.pink : Colors.black,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 30.h),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LottieScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 15.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NeueMachina',
                fontSize: 16.sp,
                fontWeight: FontWeight.w200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
