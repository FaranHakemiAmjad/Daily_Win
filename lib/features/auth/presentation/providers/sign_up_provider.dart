import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/user_account_entity.dart';
import '../../domain/usecases/sign_up.dart';

class SignUpNotifier extends AsyncNotifier<UserAccountEntity?> {
  // build() is called once when the provider is first read.
  // For action-based notifiers, initial state is just null — no action yet.
  @override
  Future<UserAccountEntity?> build() async => null;

  // ── EMAIL SIGN UP ──────────────────────────────────────────
  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    // Set state to loading — UI will show spinner
    state = const AsyncValue.loading();

    // Get the usecase from GetIt
    final useCase = sl<SignUpUseCase>();

    final params = SignUpParams(email: email, password: password);

    // Call the usecase — returns Either<Failure, UserEntity>
    final result = await useCase.call(params);

    // fold() runs the left function on failure, right function on success
    result.fold(
      (failure) {
        // Left — sign up failed
        // AsyncValue.error holds the message so the UI can display it
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (user) {
        // Right — sign up succeeded
        // AsyncValue.data holds the user
        state = AsyncValue.data(user);
      },
    );
  }
}

// The provider — this is what your UI watches
final signUpProvider =
    AsyncNotifierProvider<SignUpNotifier, UserAccountEntity?>(
      SignUpNotifier.new,
    );
