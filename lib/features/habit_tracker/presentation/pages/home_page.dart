import 'package:daily_win/app/router/app_routes.dart';
import 'package:daily_win/features/auth/presentation/providers/sign_out_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  Future<void> logOut() async {
    await ref.read(signOutProvider.notifier).signOut();

    final state = ref.read(signOutProvider);

    state.whenOrNull(
      data: (_) {
        context.go(AppRoutes.splash);
      },
      error: (_,_) => null
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton.outlined(onPressed: logOut, icon: Icon(Icons.exit_to_app_outlined)),
        ],
      ),
      body: Text('Welcome Home Cute Nigga!'),
    );
  }
}
