import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochure_quiz_app/AuthScreen/models/auth_model.dart';
import 'package:kochure_quiz_app/utils/shared_prefs.dart';

import '../../app.dart';

final fetchQuizSummaryProvider = FutureProvider<AuthModel>((ref) async {
  final fetchEyeScan = await FirebaseFirestore.instance
      .collection('users')
      .doc(SharedPrefHelper.getUserID())
      .get();

  return AuthModel.fromJson(fetchEyeScan.data()!);
});

// final fetchCorrectAnswerProvider = FutureProvider<AuthModel>((ref) async {
//   final fetchEyeScan = await FirebaseFirestore.instance
//       .collection('users')
//       .doc("MZa3Lrw9clNghjWnNiRbXS6LObd2")
//       .get();

//   return AuthModel.fromJson(fetchEyeScan.data()!);
// });