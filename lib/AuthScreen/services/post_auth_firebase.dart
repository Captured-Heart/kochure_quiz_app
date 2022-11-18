import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kochure_quiz_app/utils/shared_prefs.dart';

Future postParticipantsDetailsOnSignUp(WidgetRef ref, Map map) async {
  DocumentReference details = FirebaseFirestore.instance
      .collection('users')
      .doc(SharedPrefHelper.getUserID());
  return details.set(map);
}
Future updateFinalScore( double scoreTotal) async {
  DocumentReference details = FirebaseFirestore.instance
      .collection('users')
      .doc(SharedPrefHelper.getUserID());
  return details.update({'scoreTotal': scoreTotal});
}


Future postParticipantsScore(WidgetRef ref, Map map) async {
  DocumentReference details = FirebaseFirestore.instance
      .collection(SharedPrefHelper.getUserID())
      .doc();
  return details.set(map);
}
