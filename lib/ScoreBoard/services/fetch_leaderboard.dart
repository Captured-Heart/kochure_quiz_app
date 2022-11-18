import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochure_quiz_app/AuthScreen/models/auth_model.dart';
import 'package:kochure_quiz_app/QuizScreen/model/quiz_model.dart';

import '../../app.dart';

final fetchLeaderBoardProvider =
    StreamProvider<List<AuthModel>>((ref) async* {
  final fetchEyeScan = FirebaseFirestore.instance
      .collection('users')
      .orderBy('scoreTotal', descending: true)
      .snapshots();

  yield* fetchEyeScan.map(
    (event) => event.docs
        .map(
          (e) => AuthModel.fromJson(
            e.data(),
          ),
        )
        .toList(),
  );
});
