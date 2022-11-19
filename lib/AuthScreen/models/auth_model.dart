import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  String? userId;
  String? phoneNo;
  String? username;
  Timestamp? createdAt;
  String? email;
  num? scoreTotal;

  AuthModel({
    required this.userId,
    this.phoneNo,
    this.username,
    this.createdAt,
    this.email,
    this.scoreTotal,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        userId: json['userId'] as String?,
        phoneNo: json['phoneNo'] as String?,
        username: json['username'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
        email: json['email'] as String?,
        scoreTotal: json['scoreTotal'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'phoneNo': phoneNo,
        'username': username,
        'createdAt': Timestamp.now(),
        'email': email,
        'scoreTotal': scoreTotal,
      };
}
