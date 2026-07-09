import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/user_account_entity.dart';
import '../providers/sign_up_provider.dart';
import '../../../../app/router/app_routes.dart';

class CreateAccountPage extends ConsumerStatefulWidget {
  const CreateAccountPage({super.key});

  @override
  ConsumerState<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends ConsumerState<CreateAccountPage> {

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

  Future<void> _signUp() async {
    // Validate all form fields before doing anything
    if (!_formKey.currentState!.validate()) return;

    // Call the notifier method — this triggers the usecase
    await ref.read(signUpProvider.notifier).signUpWithEmail(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    // After the action completes, check the new state
    // ref.read (not watch) because we only need the value once here
    final state = ref.read(signUpProvider);

    state.whenOrNull(
      // Success — navigate to home
      // mounted check prevents navigation if widget was disposed
      data: (user) {
        if (user != null && mounted) {
          context.push(AppRoutes.profileSetupPath);
        }
      },
      // Error is handled by the listener below — nothing to do here
      error: (error, stacktrace) {

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Watch the provider — widget rebuilds whenever state changes
    final signUpState = ref.watch(signUpProvider);

    // Listen reacts to state changes without rebuilding the whole widget.
    // Perfect for showing snackbars, dialogs, or navigating.
    ref.listen<AsyncValue<UserAccountEntity?>>(signUpProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          // Show error message in a snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        },
      );
    });

    // isLoading is true when state is AsyncValue.loading()
    final isLoading = signUpState.isLoading;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
            'Create Account',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        ),
      ),
        body: Container(
          padding: EdgeInsetsGeometry.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email Text Field
                    Text("Email"),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        label: Text(
                          'Enter your E-mail',
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.secondaryFixedDim,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.trim())) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),

                    // Password Text Field
                    Text("Password"),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _signUp(),
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                    FilledButton(
                      onPressed: isLoading ? null : _signUp,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: isLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                          : const Text('Create Account'),
                    ),
              ],
            ),

          ),
        ),
    );
  }
}