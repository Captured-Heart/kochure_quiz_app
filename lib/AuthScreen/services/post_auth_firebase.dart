import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_services.dart';

Future postParticipantsDetailsOnSignUp(WidgetRef ref, Map map) async {
  DocumentReference details = FirebaseFirestore.instance
      .collection('users')
      .doc(ref.watch(currentUserUUIDProvider));
  return details.set(map);
}


Future postParticipantsScore(WidgetRef ref, Map map) async {
  DocumentReference details = FirebaseFirestore.instance
      .collection(ref.watch(currentUserUUIDProvider))
      .doc();
  return details.set(map);
}
