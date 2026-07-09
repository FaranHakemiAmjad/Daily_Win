import 'package:daily_win/core/database/app_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

// Exposes Firebase's auth state as a stream
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

// simple bool state — false by default (no profile yet)
// set to true after profile setup completes
final hasProfileProvider = StateProvider<bool>((ref) => false);

