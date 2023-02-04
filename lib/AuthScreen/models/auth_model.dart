import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  String? userId;
  String? phoneNo;
  String? username;
  Timestamp? createdAt;
  String? email;
  String? deviceId;

  num? scoreTotal;

  AuthModel({
    required this.userId,
    this.phoneNo,
    this.username,
    this.createdAt,
    this.email,
    this.scoreTotal,
    this.deviceId,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        userId: json['userId'] as String?,
        phoneNo: json['phoneNo'] as String?,
        username: json['username'] as String?,
        createdAt: json['createdAt'] as Timestamp?,
        email: json['email'] as String?,
        deviceId: json['deviceId'] as String?,
        scoreTotal: json['scoreTotal'] as num?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'phoneNo': phoneNo,
        'username': username,
        'createdAt': Timestamp.now(),
        'email': email,
        'scoreTotal': scoreTotal,
        'deviceId': deviceId,
      };
}
