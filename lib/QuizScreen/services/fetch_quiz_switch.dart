import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kochure_quiz_app/AuthScreen/models/quiz_switch_model.dart';

import '../../app.dart';

final fetchQuizSwitchProvider =
    StreamProvider<List<QuizSwitchModel>>((ref) async* {
  final fetchEyeScan =
      FirebaseFirestore.instance.collection('switch').snapshots();

// generalTimeSwitch
  yield* fetchEyeScan.map((event) =>
      event.docs.map((e) => QuizSwitchModel.fromJson(e.data())).toList());
});
