import 'package:flutter/material.dart';
import 'package:techcompose/app/config/config.dart';
import 'package:techcompose/app/pages/onboarding_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConst.appName,
      theme: ThemeData(
        fontFamily: Fonts.poppins,
      ),
      home: const OnboardingPage(),
    );
  }
}
