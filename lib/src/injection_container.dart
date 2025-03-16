import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/network/network_info.dart';
import 'data/datasources/country_remote_data_source.dart';
import 'data/repositories/country_repository_impl.dart';
import 'domain/repositories/country_repository.dart';
import 'domain/usecases/get_countries.dart';
import 'presentation/bloc/country/country_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(
    () => CountryBloc(getCountries: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetCountries(sl()));

  // Repositories
  sl.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(
      remoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CountryRemoteDataSource>(
    () => CountryRemoteDataSourceImpl(dio: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
