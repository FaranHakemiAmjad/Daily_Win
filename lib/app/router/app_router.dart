import 'package:daily_win/features/auth/presentation/pages/create_account_page.dart';
import 'package:daily_win/features/auth/presentation/pages/start_page.dart';
import 'package:daily_win/features/profile_manager/presentation/pages/profile_detail_page.dart';
import 'package:daily_win/features/profile_manager/presentation/pages/profile_setup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/go_router_refresh_stream.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/providers/auth_providers.dart';
import '../../features/habit_tracker/presentation/pages/home_page.dart';
import '../shell/main_shell.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final hasProfileAsync = ref.watch(hasProfileProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,

    refreshListenable: GoRouterRefreshStream(
      FirebaseAuth.instance.authStateChanges(),
    ),

    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final location = state.matchedLocation;

      final isProfileSetup = location == AppRoutes.profileSetupPath;

      final isAuthPage =
          location == AppRoutes.login ||
          location == AppRoutes.splash ||
          location == AppRoutes.signUp;

      final hasProfile = hasProfileAsync.value ?? false;

      if (user != null && isAuthPage && hasProfile) return AppRoutes.home;
      if (user == null && !isAuthPage) return AppRoutes.splash;
      if (user != null && !hasProfile && !isProfileSetup && !isAuthPage) {
        return AppRoutes.profileSetupPath;
      }

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
            routes: [
              //       path: 'add-habit', // relative — resolves to /home/add-habit
              //       builder: (context, state) => const AddHabitPage(),
              //     ),
              //   ],
              // ),
              // GoRoute(
              //   path: AppRoutes.feed,
              //   builder: (context, state) => const FeedPage(),
              //   routes: [
              //     GoRoute(
              //       path: 'activity/:id', // relative — resolves to /feed/activity/:id
              //       builder: (context, state) {
              //         final id = state.pathParameters['id']!;
              //         return ActivityDetailPage(activityId: id);
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => const ProfileDetailPage(),
          ),
        ],
      ),
    ],
  );
});
