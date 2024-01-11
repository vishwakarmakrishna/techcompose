import 'package:flutter/material.dart';

extension CustomExtension on Widget {
  Widget setbg(ImageProvider i, {BoxFit? fit}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: i,
        fit: fit ?? BoxFit.cover,
      )),
      child: this,
    );
  }

  Widget mainLinearGrad() {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            const Color(0xff0A071E).withOpacity(.62),
            const Color(0xff0A071E),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: this,
    );
  }
}
