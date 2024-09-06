import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ijeoma_og/onboarding_carousel.dart';

void main() {
  runApp(
    ScreenUtilInit(
      // ignore: prefer_const_constructors
      designSize: Size(375, 812), // Adjust this to your design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingCarousel(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
