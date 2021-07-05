import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

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