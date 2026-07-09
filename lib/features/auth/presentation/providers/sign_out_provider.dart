import 'package:daily_win/features/auth/data/datasource/local/tables/user_account_table.dart';
import 'package:daily_win/features/auth/domain/entities/user_account_entity.dart';
import 'package:daily_win/features/auth/domain/usecases/sign_out.dart';
import 'package:daily_win/features/auth/presentation/providers/sign_up_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection_container.dart';

class SignOutNotifier extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<void> signOut() async {
    state = const AsyncValue.loading();

    final useCase = sl<SignOutUseCase>();

    final result = await useCase.call();

    result.fold(
            (failure) {
      // Left — sign up failed
      // AsyncValue.error holds the message so the UI can display it
      state = AsyncValue.error(failure.message, StackTrace.current);
    },
            (success) {}
    );
  }
}

final signOutProvider = AsyncNotifierProvider<SignOutNotifier, void>(
  SignOutNotifier.new,);