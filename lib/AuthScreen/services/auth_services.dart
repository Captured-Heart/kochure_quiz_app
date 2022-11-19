// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kochure_quiz_app/AuthScreen/models/auth_model.dart';
import 'package:kochure_quiz_app/AuthScreen/services/post_auth_firebase.dart';
import 'package:kochure_quiz_app/QuizScreen/views/quiz_rules_screen.dart';
import 'package:kochure_quiz_app/utils/shared_prefs.dart';
import 'package:kochure_quiz_app/utils/top_snack_bar.dart';

import '../../app.dart';

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
          SharedPrefHelper.setUserID(id: value.user!.uid);

          ref.read(loadingProvider.notifier).update((state) => false);
          return value;
        },
      );
      // ignore: use_build_context_synchronously
      pushNamed(context, QuizRulesScreen.routeName);
      Map map = AuthModel(
        username: username,
        phoneNo: phoneNo,
        userId: SharedPrefHelper.getUserID(),
        email: email,
        scoreTotal: 0.0,
        createdAt: Timestamp.now(),
      ).toJson();
      await postParticipantsDetailsOnSignUp(ref, map);

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
