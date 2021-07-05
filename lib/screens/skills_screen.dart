import 'package:flutter/material.dart';
import 'package:nb_portfolio/models/skill_model.dart';
import 'package:nb_portfolio/widgets/custom_app_bar_widget.dart';

class SkillsScreen extends StatelessWidget {
  static const routeName = "skills";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/bg_1.jpg"), fit: BoxFit.cover),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomAppBar(),
            ),
            _quote(context),
            _MySkills(),
          ],
        ),
      ),
    );
  }
}

Widget _quote(BuildContext context) {
  return SliverToBoxAdapter(
    child: Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Will is a skill ",
                style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).buttonColor,
                    fontFamily: "Ubuntu"),
              ),
              const TextSpan(
                text: "🎯",
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: "EmojiOne"),
              ),
            ],
          ),
        )),
  );
}

class _MySkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                child: Image.asset(
                  mySkills[index].imageName,
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ),
              Text(
                mySkills[index].skillName,
                style: TextStyle(
                  color: Theme.of(context).buttonColor,
                  fontSize: 16,
                ),
              ),
              _StackedBar(
                  mySkills[index].color, mySkills[index].confidenceLevel),
            ],
          ),
        ),
        childCount: mySkills.length,
      ),
    );
  }
}

class _StackedBar extends StatelessWidget {
  final Color color;
  final int confindenceLevel;
  _StackedBar(this.color, this.confindenceLevel);

  Widget confindenceBar(Color color, int confindenceLevel) {
    if (confindenceLevel == 1) {
      return Container(
        decoration: BoxDecoration(color: color),
        height: 10,
        width: 30,
      );
    } else if (confindenceLevel == 2) {
      return Container(
        decoration: BoxDecoration(color: color),
        height: 10,
        width: 60,
      );
    } else if (confindenceLevel == 3) {
      return Container(
        decoration: BoxDecoration(color: color),
        height: 10,
        width: 100,
      );
    } else if (confindenceLevel == 4) {
      return Container(
        decoration: BoxDecoration(color: color),
        height: 10,
        width: 140,
      );
    } else if (confindenceLevel == 5) {
      return Container(
        decoration: BoxDecoration(color: color),
        height: 10,
        width: 150,
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 7),
      height: 10,
      width: 150,
      color: Colors.white70,
      child: Row(
        children: [
          confindenceBar(color, confindenceLevel),
        ],
      ),
    );
  }
}
