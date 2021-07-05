import 'package:flutter/material.dart';

class SkillModel {
  final String skillName;
  final String imageName;
  final Color color;
  final int confidenceLevel;
  SkillModel({
    @required this.skillName,
    @required this.imageName,
    @required this.color,
    @required this.confidenceLevel, // max 5
  });
}

List mySkills = [
  SkillModel(
      skillName: "Python",
      imageName: "assets/images/skills/python.png",
      color: Colors.yellow[700],
      confidenceLevel: 4),
  SkillModel(
      skillName: "Flutter",
      imageName: "assets/images/skills/flutter.png",
      color: Colors.blueAccent,
      confidenceLevel: 4),
  SkillModel(
      skillName: "Javascript",
      imageName: "assets/images/skills/js.png",
      color: Colors.yellow[600],
      confidenceLevel: 3),
  SkillModel(
      skillName: "NoSql",
      imageName: "assets/images/skills/nosql.png",
      color: Colors.orange[400],
      confidenceLevel: 4),
  SkillModel(
      skillName: "Git",
      imageName: "assets/images/skills/git.png",
      color: Colors.red,
      confidenceLevel: 4),
  SkillModel(
      skillName: "GCP",
      imageName: "assets/images/skills/gcp.png",
      color: Colors.blue,
      confidenceLevel: 3),
  SkillModel(
      skillName: "Redis",
      imageName: "assets/images/skills/redis.png",
      color: Colors.red[400],
      confidenceLevel: 1),
  SkillModel(
      skillName: "Notion",
      imageName: "assets/images/skills/notion.png",
      color: Colors.black54,
      confidenceLevel: 4),
  SkillModel(
      skillName: "Shell",
      imageName: "assets/images/skills/shell.png",
      color: Colors.white,
      confidenceLevel: 2),
  SkillModel(
      skillName: "Xd",
      imageName: "assets/images/skills/xd.png",
      color: Colors.pink,
      confidenceLevel: 3),
];
