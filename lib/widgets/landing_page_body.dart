import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LandingPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _catchText(context),
        _Animation(),
      ],
    );
  }
}

class _Animation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 100,
      ),
      child: Align(
        alignment: Alignment.center,
        child: LottieBuilder.asset(
          "assets/animations/laptop.json",
          height: 300,
          width: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

Widget _catchText(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 140, left: 25, right: 20),
    child: Align(
      alignment: Alignment.centerLeft,
      child: DefaultTextStyle(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 28,
              color: Theme.of(context).buttonColor,
              fontFamily: "ZenTokyoZoo"),
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(seconds: 8),
            animatedTexts: [
              FlickerAnimatedText("Control is an illussion",
                  speed: const Duration(seconds: 2)),
            ],
          )),
    ),
  );
}

