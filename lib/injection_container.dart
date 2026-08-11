import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Core
import 'core/database/app_database.dart';

// Auth — datasources
import 'features/auth/data/datasource/local/auth_local_datasource.dart';
import 'features/auth/data/datasource/remote/auth_firestore_datasource.dart';
import 'features/auth/data/datasource/remote/auth_firebase_datasource.dart';

// Auth — repository
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/data/repositories/auth_repository_impl.dart';

// Auth — usecases
import 'features/auth/domain/usecases/get_cached_user.dart';
import 'features/auth/domain/usecases/sign_in_with_email.dart';
import 'features/auth/domain/usecases/sign_up.dart';
import 'features/auth/domain/usecases/sign_in_with_google.dart';
import 'features/auth/domain/usecases/sign_out.dart';

// Profile Management - datasources
import 'package:daily_win/features/profile_manager/data/datasource/local/profile_manager_local_datasource.dart';
import 'package:daily_win/features/profile_manager/data/datasource/remote/profle_manager_remote_datasource.dart';

// Profile Management - repository
// Profile Management - usecases


final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => AppDatabase());

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // GoogleSignIn — one instance shared across the app
  // sl.registerLazySingleton(
  //       () => GoogleSignIn(
  //     scopes: ['email', 'profile'],
  //   ),
  // );

  // ── 2. DATASOURCES ────────────────────────────────────────
  // Registered as their abstract types so repositories can depend
  // on abstractions not concretions (Clean Architecture rule).

  // Auth local datasource — needs AppDatabase
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      db: sl(), // GetIt resolves AppDatabase registered above
    ),
  );

  // Auth remote datasource — needs FirebaseAuth and GoogleSignIn
  sl.registerLazySingleton<AuthFirebaseDataSource>(
    () => AuthFirebaseDataSourceImpl(
      firebaseAuth: sl(), // GetIt resolves FirebaseAuth
      // googleSignIn: sl(), // GetIt resolves GoogleSignIn
    ),
  );

  sl.registerLazySingleton<AuthFirestoreDataSource>(
    () => AuthFirestoreDataSourceImpl(firestore: sl()),
  );

  // Profile Management
  sl.registerLazySingleton<ProfileManagerLocalDatasource>(
    () => ProfileManagerLocalDatasourceImpl(db: sl()),
  );
  sl.registerLazySingleton<ProfileManagerRemoteDatasource>(
      () => ProfileManagerRemoteDatasourceImpl(firestore : sl()),
  );

  // ── 3. REPOSITORIES ───────────────────────────────────────
  // Profile repository must be registered BEFORE auth repository
  // because AuthRepositoryImpl depends on ProfileRepository

  // Auth repository — needs auth datasources AND profile repository
  // profile repository is needed to create profile after sign up
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(), // GetIt resolves AuthRemoteDataSource
      localDataSource: sl(), // GetIt resolves AuthLocalDataSource
      firestoreDataSource: sl(),
    ),
  );

  // ── 4. USECASES ───────────────────────────────────────────
  // Each usecase gets its own registration.
  // They all depend on their respective repository.
  // No need to register as abstract — usecases are not abstracted.

  // Auth usecases — all depend on AuthRepository
  sl.registerLazySingleton(() => GetCachedUserUseCase(repository: sl()));

  sl.registerLazySingleton(() => SignInWithEmailUseCase(repository: sl()));

  sl.registerLazySingleton(() => SignUpUseCase(repository: sl()));

  sl.registerLazySingleton(() => SignOutUseCase(repository: sl()));
}
