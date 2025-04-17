import 'package:baanknet/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/bottom_nav_bar/bottom_nav_bar.dart';
import 'modules/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // iPhone X dimensions; adjust based on your design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(title: 'BaankNet App', theme: AppTheme.lightTheme(), home: const MainScreen());
      },
    );
  }
}
