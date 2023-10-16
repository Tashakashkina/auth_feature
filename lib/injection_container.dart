import 'package:auth_feature/feature/data/datasources/auth_feature_local_data_source.dart';
import 'package:auth_feature/feature/domain/repositories/auth_feature_repository.dart';
import 'package:auth_feature/feature/domain/usecases/clear_storage.dart';
import 'package:auth_feature/feature/domain/usecases/restore_token.dart';
import 'package:auth_feature/feature/network/network_info.dart';
import 'package:auth_feature/feature/presentation/bloc/bloc/token/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'feature/data/datasources/auth_feature_remote_data_source.dart';
import 'feature/data/repositories/auth_feature_repository_impl.dart';
import 'feature/domain/usecases/get_token.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton(() => AuthBloc(
        restoreToken: sl(),
        clearStorage: sl(),
      ));

  sl.registerLazySingleton(() => RestoreToken(sl()));
  sl.registerLazySingleton(() => ClearStorage(sl()));

  sl.registerLazySingleton<AuthFeatureRepository>(
    () => AuthFeatureRepositoryImpl(
        localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()),
  );

  sl.registerLazySingleton<AuthFeatureRemoteDataSource>(
      () => AuthFeatureRemoteDataSourceImpl(
            instance: sl(),
          ));

  sl.registerLazySingleton<AuthFeatureLocalDataSource>(
      () => AuthFeatureLocalDataSourceImpl(
            sharedPreferences: sl(),
          ));
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
