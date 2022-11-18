import 'package:cloud_firestore/cloud_firestore.dart';

class QuizModel {
  String? userId;

  Timestamp? createdAt;
  double? score;
  double? scoreTotal;
  int? questionNo;

  QuizModel({
    required this.userId,
    this.createdAt,
    required this.score,
    required this.scoreTotal,
    required this.questionNo,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        userId: json['userId'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
        score: json['score'] as double?,
        scoreTotal: json['scoreTotal'] as double?,
        questionNo: json['questionNo'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'createdAt': Timestamp.now(),
        'score': score,
        'scoreTotal': scoreTotal,
        'questionNo': questionNo,
      };
}
