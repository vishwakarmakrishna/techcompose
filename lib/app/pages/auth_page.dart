import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'dart:math' as math;
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

  bool isShowPassword = false;
  bool isShowConfirmPassword = false;
  bool isTos = false;

  void onChangePassword() {
    if (!mounted) return;
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  void onChangeConfirmPassword() {
    if (!mounted) return;
    setState(() {
      isShowConfirmPassword = !isShowConfirmPassword;
    });
  }

  void onChangeTos(bool? value) {
    if (!mounted) return;
    if (value == null) return;
    setState(() {
      isTos = value;
    });
  }

  void onBackPress() {
    Navigator.of(context).pop();
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkResponse(
                  onTap: onBackPress,
                  child: Assets.images.back.image(),
                ),
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: CupertinoTextFormFieldRow(
                    padding: EdgeInsets.zero,
                    placeholder: AppConst.emailHint,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    placeholderStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    decoration: const BoxDecoration(),
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
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CupertinoTextFormFieldRow(
                          padding: EdgeInsets.zero,
                          placeholder: AppConst.passwordHint,
                          obscureText: isShowPassword,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          placeholderStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      InkResponse(
                        onTap: onChangePassword,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Transform.rotate(
                            angle: isShowPassword ? -math.pi : math.pi / 180,
                            child: Assets.images.hidden.image(),
                          ),
                        ),
                      )
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
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CupertinoTextFormFieldRow(
                          padding: EdgeInsets.zero,
                          placeholder: AppConst.passwordHint,
                          obscureText: isShowConfirmPassword,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          placeholderStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          decoration: const BoxDecoration(),
                        ),
                      ),
                      InkResponse(
                        onTap: onChangeConfirmPassword,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Transform.rotate(
                            angle: isShowConfirmPassword
                                ? -math.pi
                                : math.pi / 180,
                            child: Assets.images.hidden.image(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
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
                    value: isTos,
                    onChanged: onChangeTos,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        text: 'I agree to the ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'terms',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Not Implemented")));
                              },
                            style: const TextStyle(
                                decoration: TextDecoration.underline),
                          ),
                          const TextSpan(text: ' And '),
                          TextSpan(
                            text: 'privacy policy',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Not Implemented")));
                              },
                            style: const TextStyle(
                                decoration: TextDecoration.underline),
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
              DecoratedBox(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xff892AEC),
                    Color(0xff3635EC),
                  ]),
                ),
                child: MaterialButton(
                  onPressed: navigateToHomePage,
                  child: const Padding(
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
