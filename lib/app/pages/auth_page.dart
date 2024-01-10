import 'package:flutter/material.dart';
import 'package:techcompose/app/config/constants.dart';
import 'package:techcompose/app/config/resources/assets.gen.dart';
import 'package:techcompose/app/config/resources/fonts.gen.dart';
import 'package:techcompose/app/pages/home_page.dart';
import 'package:techcompose/app/pages/widgets/background_image.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void navigateToHomePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Assets.images.back.image(),
            ),
            const SizedBox(
              height: 18,
            ),
            // Main Title
            const Text(
              AppConst.authTitle,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 50,
                fontFamily: Fonts.secularOne,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            // email
            const Text(
              AppConst.email,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xff3F1E88),
                border: Border.all(
                  color: const Color(0xff892AEC),
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 2,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  AppConst.emailHint,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            // password
            const Text(
              AppConst.password,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xff3F1E88),
                border: Border.all(
                  color: const Color(0xff892AEC),
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      AppConst.passwordHint,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Assets.images.hidden.image()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            //confirm password
            const Text(
              AppConst.confirmPassword,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xff3F1E88),
                border: Border.all(
                  color: const Color(0xff892AEC),
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 2,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // No hint
                    const Text(
                      "",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Assets.images.hidden.image()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            // tos
            Row(
              children: [
                Checkbox(
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  value: false,
                  onChanged: (bool? value) {},
                ),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      text: 'I agree to the ',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'terms',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: ' And '),
                        TextSpan(
                          text: 'privacy policy',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: navigateToHomePage,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff892AEC),
                    Color(0xff3635EC),
                  ]),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    AppConst.authTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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
          Assets.images.accountBackground.provider(),
        );
  }
}
