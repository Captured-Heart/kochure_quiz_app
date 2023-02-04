import 'package:cloud_firestore/cloud_firestore.dart';

class QuizSwitchModel {
  Timestamp? createdAt;

  num? generalTimeSwitch;

  QuizSwitchModel({
    this.createdAt,
    this.generalTimeSwitch,
  });

  factory QuizSwitchModel.fromJson(Map<String, dynamic> json) =>
      QuizSwitchModel(
        createdAt: json['createdAt'] as Timestamp?,
        generalTimeSwitch: json['generalTimeSwitch'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'createdAt': Timestamp.now(),
        'generalTimeSwitch': generalTimeSwitch,
      };
}
