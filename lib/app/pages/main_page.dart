import 'package:flutter/material.dart';
import 'package:techcompose/app/config/resources/assets.gen.dart';
import 'package:techcompose/app/pages/widgets/background_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold()

        // gradient layer
        .mainLinearGrad()
        // main bg layer
        .setbg(
          Assets.images.mainBackground.provider(),
        );
  }
}
