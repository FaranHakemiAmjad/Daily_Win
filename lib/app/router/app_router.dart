import 'package:daily_win/features/auth/presentation/pages/create_account_page.dart';
import 'package:daily_win/features/auth/presentation/pages/start_page.dart';
import 'package:daily_win/features/habit_manager/habit_mutation/presentation/pages/create_habit_page.dart';
import 'package:daily_win/features/profile_manager/presentation/pages/profile_detail_page.dart';
import 'package:daily_win/features/profile_manager/presentation/pages/profile_setup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/habit_manager/habit_query/presentation/pages/home_page.dart';
import '../shell/main_shell.dart';
import 'app_routes.dart';

/// [RouterNotifier] bridges Riverpod state changes to GoRouter's [refreshListenable].
/// 
/// BY LISTENING to authStateProvider and hasProfileProvider HERE (instead of using ref.watch
/// inside appRouterProvider), we prevent GoRouter from being destroyed and re-instantiated
/// on state updates. This preserves the navigation back stack across route pushes.
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    // Notify GoRouter when Firebase Auth state changes (login / logout)
    _ref.listen<AsyncValue<User?>>(
      authStateProvider,
      (_, _) => notifyListeners(),
    );

    // Notify GoRouter when user profile state updates (profile checked / created)
    _ref.listen<AsyncValue<bool>>(
      hasProfileProvider,
      (_, _) => notifyListeners(),
    );
  }
}

final appRouterProvider = Provider<GoRouter>((ref) {
  // Create a single persistent RouterNotifier bound to this Provider's Ref
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,

    // Triggers GoRouter's redirect logic whenever RouterNotifier notifies listeners,
    // WITHOUT re-creating the GoRouter instance or wiping the Navigator back stack.
    refreshListenable: notifier,

    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final location = state.matchedLocation;

      final isProfileSetup = location == AppRoutes.profileSetupPath;

      final isAuthPage =
          location == AppRoutes.login ||
          location == AppRoutes.splash ||
          location == AppRoutes.signUp;

      // Use ref.read instead of ref.watch so the provider does not re-build GoRouter
      final hasProfile = ref.read(hasProfileProvider).value ?? false;
      final hasProfileAsync = ref.read(hasProfileProvider);

      if (user != null && hasProfileAsync.isLoading) {
        // Stay on current screen (e.g. Splash/Login) while loading.
        // Do NOT redirect to profile setup yet!
        return null;
      }

      if (user != null) {
        if (hasProfile) {
          // If authenticated and profile exists, redirect away from auth/setup pages to Home.
          // Standard sub-routes (e.g. /add-habit or /profile) remain intact on the stack.
          if (isAuthPage || isProfileSetup) return AppRoutes.home;
        } else {
          // Authenticated but profile not created yet -> direct to profile setup
          if (!isProfileSetup) return AppRoutes.profileSetupPath;
        }
      }

      // Unauthenticated user attempting to access protected screens -> redirect to splash/auth
      if (user == null && !isAuthPage) return AppRoutes.splash;

      // Allow navigation to proceed as normal for all other route transitions
      return null;
    },

    routes: [
      // Start Screen
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const StartPage(),
      ),

      // Login Screen
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginPage(),
      ),

      // Create Account Screen
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const CreateAccountPage(),
        routes: [
          // Profile Set Up
          GoRoute(
            path: AppRoutes.profileSetup,
            builder: (context, state) => const ProfileSetupPage(),
          ),
        ],
      ),

      // ShellRoute keeps bottom nav alive across tab switches
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),

        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomePage(),
            routes: [],
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => const ProfileDetailPage(),
          ),
        ],
      ),

      // Create Habit Screen
      GoRoute(
        path: AppRoutes.addHabit,
        builder: (context, state) => const CreateHabitPage(),
      ),
    ],
  );
});
