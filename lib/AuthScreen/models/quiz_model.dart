import 'package:cloud_firestore/cloud_firestore.dart';

class QuizModel {
  String? userId;
  String? phoneNo;
  String? username;
  Timestamp? createdAt;
  String? score;
  String? scoreTotal;
  String? questionNo;
  String? email;

  QuizModel({
    this.userId,
    this.phoneNo,
    this.username,
    this.createdAt,
    this.score,
    this.scoreTotal,
    this.questionNo,
    this.email,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
      userId: json['userId'] as String?,
      phoneNo: json['phoneNo'] as String?,
      username: json['username'] as String?,
      createdAt: json['createdAt'] as Timestamp?,
      score: json['score'] as String?,
      scoreTotal: json['scoreTotal'] as String?,
      questionNo: json['questionNo'] as String?,
      email: json['email'] as String?);

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'phoneNo': phoneNo,
        'username': username,
        'createdAt': Timestamp.now(),
        'score': score,
        'scoreTotal': scoreTotal,
        'questionNo': questionNo,
        'email': email,
      };
}
