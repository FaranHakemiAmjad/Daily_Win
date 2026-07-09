import 'dart:async';

import 'package:daily_win/features/auth/domain/entities/user_account_entity.dart';
import 'package:daily_win/features/auth/domain/usecases/sign_in_with_email.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection_container.dart';

class SignInWithEmailNotifier extends AsyncNotifier<UserAccountEntity?> {
  @override
  FutureOr<UserAccountEntity?> build() => null;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final useCase = sl<SignInWithEmailUseCase>();

    final params = SignInWithEmailParams(email: email, password: password);
    final result = await useCase.call(params);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (user) {
        state = AsyncValue.data(user);
      },
    );
  }
}

final signInWithEmailProvider =
    AsyncNotifierProvider<SignInWithEmailNotifier, UserAccountEntity?>(
        SignInWithEmailNotifier.new);
