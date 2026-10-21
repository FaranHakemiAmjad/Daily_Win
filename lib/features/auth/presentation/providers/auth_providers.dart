import 'package:daily_win/features/profile_manager/domain/usecases/get_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection_container.dart';

// Exposes Firebase's auth state as a stream
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

// simple bool state — false by default (no profile yet)
// set to true after profile setup completes

// final hasProfileProvider = StateProvider<bool>((ref) => false);

// reads from Drift and Firestore to check if profile exists
final hasProfileProvider = FutureProvider<bool>((ref) async {
  // Watch authStateProvider so this provider automatically re-runs on login/logout
  final authState = ref.watch(authStateProvider);
  final user = authState.value ?? FirebaseAuth.instance.currentUser;

  // not logged in — no profile to check
  if (user == null) return false;

  // check Drift cache / Firestore for existing profile
  final result = await sl<GetUserProfileUseCase>().call(user.uid);

  return result.fold(
    (failure) => false,      // something went wrong — assume no profile
    (profile) => profile != null, // profile exists → true, null → false
  );
});

