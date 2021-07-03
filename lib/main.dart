import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_portfolio/icons/pyramid_icon_icons.dart';
import 'package:nb_portfolio/widgets/landing_page_body.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(Root());
}

class Root extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Ubuntu",
        buttonColor: Colors.white,
      ),
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/bg_1.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            _AppBar(),
            LandingPageBody(),
            FunnyFacts(),
            emailAddress(context),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _sampleButton(context),
          _LogoTitle(),
          _projects(context),
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
      onPress: () {},
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
    return Row(
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
    );
  }
}

Widget emailAddress(BuildContext context) {
  return Container(
    alignment: Alignment.bottomLeft,
    margin: const EdgeInsets.only(bottom: 5, left: 10),
    child: InkWell(
      splashColor: Colors.transparent,
      child: Container(
        width: 80,
        child: Lottie.asset(
          "assets/animations/send_email.json",
          repeat: false,
          height: 80,
          width: 20,
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
      ),
      // todo add email link
      onTap: () => print("email..."),
    ),
  );
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

class FunnyFacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 20, right: 20, bottom: 20),
        child: Align(
          alignment: Alignment.bottomRight,
          child: DefaultTextStyle(
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(fontSize: 14, color: Theme.of(context).buttonColor),
            child: AnimatedTextKit(
              animatedTexts: [
                ScaleAnimatedText(
                  "The first computer “bug” was an actual real-life bug",
                  duration: const Duration(seconds: 7),
                ),
                ScaleAnimatedText(
                  "There are more than 700 different programming languages",
                  duration: const Duration(seconds: 7),
                ),
                ScaleAnimatedText(
                  "Many programming languages share the same structure",
                  duration: const Duration(seconds: 7),
                ),
                ScaleAnimatedText(
                  "APIs are like stars, once a class is there everybody will assume it will always be there",
                  duration: const Duration(seconds: 7),
                ),
                ScaleAnimatedText(
                  "Programmers will start the count from zero, not one",
                  duration: const Duration(seconds: 7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
