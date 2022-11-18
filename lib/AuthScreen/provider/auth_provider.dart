import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_services.dart';

final firebaseProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

/// user current [uuid]
final currentUUIDProvider = Provider<String>((ref) {
  return ref.watch(firebaseProvider).currentUser!.uid;
});

/// auth services [signOut_signIn_etc]
final authProvider = Provider<AuthenticationServices>((ref) {
  return AuthenticationServices(ref.watch(firebaseProvider));
});

final authStateChangesProvider = StreamProvider<User?>((ref) async* {
  yield* ref.watch(firebaseProvider).authStateChanges();
});
