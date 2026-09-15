import 'dart:async';

import 'package:daily_win/core/error/failures.dart';
import 'package:daily_win/features/auth/data/datasource/local/auth_local_datasource.dart';
import 'package:daily_win/features/auth/data/datasource/remote/auth_firestore_datasource.dart';
import 'package:daily_win/features/auth/presentation/providers/auth_providers.dart';
import 'package:daily_win/features/profile_manager/domain/entities/user_profile_entity.dart';
import 'package:daily_win/features/profile_manager/domain/usecases/create_user_profile.dart';
import 'package:daily_win/features/profile_manager/presentation/providers/form_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../injection_container.dart';

class CreateProfileNotifier extends AsyncNotifier<UserProfileEntity?> {
  @override
  FutureOr<UserProfileEntity?> build() async => null;

  Future<void> createProfile({required UserProfileState profileState}) async {

    state = const AsyncValue.loading();

    final createProfileUseCase = sl<CreateUserProfileUseCase>();

    final localRepository = sl<AuthLocalDataSource>();
    final user = await localRepository.getCachedUser();

    final profile = UserProfileEntity(id: user!.uid, username: profileState.username, gender: profileState.gender, dateOfBirth: profileState.birthDate, profileImage: profileState.profileImage, biography: profileState.biography);

    final result = await createProfileUseCase.call(profile);

    result.fold(
        (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
        },
        (profile) {
          // ref.read(hasProfileProvider.notifier).state = true;
          state = AsyncValue.data(profile);
        }
    );
  }
}

final createProfileProvider = AsyncNotifierProvider<CreateProfileNotifier, UserProfileEntity?>(
  CreateProfileNotifier.new,
);
