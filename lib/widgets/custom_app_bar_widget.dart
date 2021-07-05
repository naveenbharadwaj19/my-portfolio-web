import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_portfolio/icons/pyramid_icon_icons.dart';
import 'package:nb_portfolio/main.dart';
import 'package:nb_portfolio/models/url_launcher.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _sampleButton(context),
          _LogoTitle(),
          // _projects(context),
        ],
      ),
    );
  }
}

Widget _sampleButton(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: AnimatedButton(
      width: 100,
      text: 'Github',
      isReverse: true,
      selectedTextColor: Colors.black,
      transitionType: TransitionType.CENTER_LR_IN,
      backgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      textStyle: TextStyle(fontSize: 16, color: Theme.of(context).buttonColor),
      onPress: () => Timer(Duration(seconds: 1),()=> launchGithubProfile()),
    ),
  );
}

class _LogoTitle extends StatefulWidget {
  @override
  __LogoTitleState createState() => __LogoTitleState();
}

class __LogoTitleState extends State<_LogoTitle> {
  bool isTitleAnimationCompleted = false;
  Widget title(BuildContext context) {
    return Text(
      "N.B",
      style: TextStyle(
          color: Theme.of(context).buttonColor,
          fontFamily: "ZenTokyoZoo",
          fontSize: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => Navigator.pushReplacementNamed(context, LandingPage.routeName),
      child: Row(
        children: [
          Icon(
            PyramidIcon.noun_pyramid_1040358,
            size: 50,
            color: Theme.of(context).buttonColor,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: isTitleAnimationCompleted
                ? title(context)
                : AnimatedTextKit(
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                    onFinished: () {
                      setState(() {
                        isTitleAnimationCompleted = true;
                      });
                    },
                    animatedTexts: [
                      FlickerAnimatedText(
                        "N.B",
                        speed: const Duration(seconds: 3),
                        textStyle: TextStyle(
                            color: Theme.of(context).buttonColor,
                            fontFamily: "ZenTokyoZoo",
                            fontSize: 22),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

Widget _projects(BuildContext context) {
  return Align(
    alignment: Alignment.topRight,
    child: GestureDetector(
      onTap: () => print("view project"),
      child: Wrap(
        children: [
          LottieBuilder.asset(
            "assets/animations/view_project.json",
            height: 40,
            width: 30,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              "View projects",
              style:
                  TextStyle(color: Theme.of(context).buttonColor, fontSize: 14),
            ),
          ),
        ],
      ),
    ),
  );
}
