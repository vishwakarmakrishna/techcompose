import 'dart:async';

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
  late PageController? controller;
  void navigateToAuthPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AuthPage(),
      ),
    );
  }

  late Timer timer;
  List<ImageProvider<Object>> imageData =
      List.generate(5, (index) => Assets.images.mainBackground.provider());
  @override
  void initState() {
    super.initState();
    controller = PageController();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      // Auto-animate to the next page every 3 seconds
      if ((controller?.page ?? 0) < imageData.length - 1) {
        controller?.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // If on the last page, jump back to the first page
        controller?.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    timer.cancel();
    super.dispose();
  }

  int activePageIndex = 0;
  void onPageChanged(int i) {
    if (!mounted) return;
    setState(() {
      activePageIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: imageData.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, i) =>
                  const SizedBox.expand().mainLinearGrad().setbg(
                        imageData.elementAt(i),
                      )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
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
                      imageData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: CircleAvatar(
                          maxRadius: 4,
                          backgroundColor: index == (activePageIndex)
                              ? Colors.white
                              : Colors.white30,
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
                  DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff892AEC),
                        Color(0xff3635EC),
                      ]),
                    ),
                    child: MaterialButton(
                      onPressed: navigateToAuthPage,
                      child: const Padding(
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

                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff892AEC),
                        strokeAlign: BorderSide.strokeAlignInside,
                        width: 2,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: navigateToAuthPage,
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

                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xff892AEC),
                        strokeAlign: BorderSide.strokeAlignInside,
                        width: 2,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: navigateToAuthPage,
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
        ],
      ),
    );
  }
}
