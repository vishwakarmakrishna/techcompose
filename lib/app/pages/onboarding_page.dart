import 'package:flutter/material.dart';
import 'package:techcompose/app/config/constants.dart';
import 'package:techcompose/app/config/resources/assets.gen.dart';
import 'package:techcompose/app/config/resources/fonts.gen.dart';
import 'package:techcompose/app/pages/auth_page.dart';
import 'package:techcompose/app/pages/widgets/background_image.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  void navigateToAuthPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Main Title
            const Text(
              AppConst.onBaordingTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontFamily: Fonts.secularOne,
                color: Colors.white,
              ),
            ),
            // three Dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: CircleAvatar(
                    maxRadius: 4,
                    backgroundColor: index == 0 ? Colors.white : Colors.white30,
                  ),
                ),
              ).toList(),
            ),
            const SizedBox(height: 30),
            // random text
            const Text(
              AppConst.onBaordingContent,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            // 3 btns
            GestureDetector(
              onTap: navigateToAuthPage,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff892AEC),
                    Color(0xff3635EC),
                  ]),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    AppConst.onBoardingSubscribe,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            GestureDetector(
              onTap: navigateToAuthPage,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff892AEC),
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 2,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    AppConst.onBoardingbtn2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            GestureDetector(
              onTap: navigateToAuthPage,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xff892AEC),
                    strokeAlign: BorderSide.strokeAlignInside,
                    width: 2,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    AppConst.onBoardingbtn3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
        // gradient layer
        .mainLinearGrad()
        // main bg layer
        .setbg(
          Assets.images.mainBackground.provider(),
        );
  }
}
