import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_portfolio/models/url_launcher.dart';
import 'package:nb_portfolio/screens/skills_screen.dart';
import 'package:nb_portfolio/widgets/custom_app_bar_widget.dart';
import 'package:nb_portfolio/widgets/funny_facts.dart';
import 'package:nb_portfolio/widgets/landing_page_body.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(Root());
}

class Root extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'N.B - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Ubuntu",
        buttonColor: Colors.white,
      ),
      builder: (context, widget) => ResponsiveWrapper.builder(
        widget,
        defaultScale: true,
        minWidth: 420,
        breakpoints: [
          ResponsiveBreakpoint.resize(420, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
        backgroundColor: Colors.red,
      ),
      routes: {
        LandingPage.routeName: (context) => LandingPage(),
        SkillsScreen.routeName: (context) => SkillsScreen(),
      },
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  static const routeName = "home";
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
            CustomAppBar(),
            LandingPageBody(),
            FunnyFacts(),
            emailAddress(context),
          ],
        ),
      ),
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
      onTap: () => openEmail(),
    ),
  );
}
