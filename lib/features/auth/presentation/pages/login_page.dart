import 'package:daily_win/app/router/app_routes.dart';
import 'package:daily_win/features/auth/domain/entities/user_account_entity.dart';
import 'package:daily_win/features/auth/presentation/providers/sign_in_with_email_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {

    if (!_formKey.currentState!.validate()) return;

    await ref
        .read(signInWithEmailProvider.notifier)
        .signInWithEmail(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final state = ref.read(signInWithEmailProvider);

    state.whenOrNull(
      data: (user) {
        if (user != null && mounted) {
          context.go(AppRoutes.home);
        }
      },
      error: (error, stacktrace) {
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final signInState = ref.watch(signInWithEmailProvider);

    ref.listen<AsyncValue<UserAccountEntity?>>(signInWithEmailProvider,
        (previous, next) {
          next.whenOrNull(
            error: (error, _) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.toString()),
                  backgroundColor: Theme.of(context).colorScheme.error,
                ),
              );
            }
          );
        });

    final isLoading = signInState.isLoading;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Continue with Email',
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),)),
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Email Text Field
                  Text('Email'),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Enter your E-mail',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryFixedDim,
                        ),
                      ),
                      suffixIcon: IconButton(onPressed: () {
                        setState(() => _emailController.clear());
                      }, icon: Icon(Icons.clear))
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  // Password Text Field
                  Text('Password'),
                  TextFormField(
                    obscureText: _obscurePassword,
                    controller: _passwordController,
                    onFieldSubmitted: (_) => _signIn(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        'Enter your password',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.secondaryFixedDim,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(() => _obscurePassword = !_obscurePassword);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: () {
                    context.push(AppRoutes.signUp);
                  },
                  child: Text("Don't have account? Let's create!"),
                ),
                FilledButton(
                  onPressed: isLoading ? null : _signIn,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: isLoading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                      : const Text('Login'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
