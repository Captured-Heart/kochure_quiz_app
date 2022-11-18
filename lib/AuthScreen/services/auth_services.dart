// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kochure_quiz_app/AuthScreen/services/post_auth_firebase.dart';
import 'package:kochure_quiz_app/utils/top_snack_bar.dart';

import '../../app.dart';
import '../models/quiz_model.dart';

final currentUserUUIDProvider = StateProvider<String>((ref) {
  return '';
});

class AuthenticationServices {
  AuthenticationServices(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

//! SIGN UP FUNCTION
  Future signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String phoneNo,
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    ref.read(loadingProvider.notifier).update((state) => true);
    try {
      UserCredential user = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) async {
          ref
              .read(currentUserUUIDProvider.notifier)
              .update((state) => value.user!.uid);

          ref.read(loadingProvider.notifier).update((state) => false);
          return value;
        },
      );
      Map map = QuizModel(
        username: username,
        phoneNo: phoneNo,
        userId: ref.watch(currentUserUUIDProvider),
        email: email,
        score: '',
        scoreTotal: '',
        questionNo: '',
        createdAt: Timestamp.now(),
      ).toJson();
      await postParticipantsDetailsOnSignUp(ref, map);
      await postParticipantsScore(ref, map);
      // ignore: use_build_context_synchronously
      pushNamed(context, QuizScreenDesktop.routeName);
      return user.user;
    } on FirebaseAuthException catch (e) {
      return topSnack(context: context, message: e.message!, isError: true);
      // snack(context, e.message!, errorTrue: true);
    }
  }

//!SIGN OUT FUNCTION
  Future signOut() async {
    try {
      _firebaseAuth.signOut();
    } catch (e) {
      return e;
    }
  }

  //! RESET PASSWORD
  Future resetPassWord(String email) async {
    try {
      _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e;
    }
  }
}
