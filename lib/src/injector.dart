import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:miles_education/src/domain/usecases/feed/get_feed.dart';
import 'package:miles_education/src/domain/usecases/testimonials/get_testimonials.dart';
import 'package:miles_education/src/presentation/bloc/feed/feed_cubit.dart';
import 'package:miles_education/src/presentation/bloc/loading/loading_cubit.dart';
import 'package:miles_education/src/presentation/bloc/testimonials/testimonials_cubit.dart';

import 'core/api_client.dart';
import 'data/datasource/local/app_local_datasource.dart';
import 'data/datasource/local/authentication_local_datasouce.dart';
import 'data/datasource/local/miles_local_datasource.dart';
import 'data/datasource/remote/app_remote_datasource.dart';
import 'data/datasource/remote/authentication_remote_datasource.dart';
import 'data/datasource/remote/miles_remote_datasource.dart';
import 'data/repositories/app_repository_impl.dart';
import 'data/repositories/authentication_repository_impl.dart';
import 'data/repositories/miles_repository_impl.dart';
import 'domain/repositories/app_repository.dart';
import 'domain/repositories/authentication_repository.dart';
import 'domain/repositories/miles_repository.dart';

final getItInstance = GetIt.I;

Future init() async {

  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));

  // Datasource Registrations

  getItInstance.registerLazySingleton<AppRemoteDataSource>(
          () => AppRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<AppLocalDataSource>(
          () => AppLocalDataSourceImpl());

  getItInstance
      .registerLazySingleton<MilesLocalDataSource>(() => MilesLocalDatasourceImpl());

  getItInstance.registerLazySingleton<MilesRemoteDatasource>(
          () => AVRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<AuthenticationLocalDataSource>(
          () => AuthenticationLocalDataSourceImpl());

  getItInstance.registerLazySingleton<AuthenticationRemoteDataSource>(
          () => AuthenticationRemoteDataSourceImpl(getItInstance()));

  // Abstract Repository Registration

  getItInstance.registerLazySingleton<AppRepository>(() => AppRepositoryImpl(
    getItInstance(),
  ));

  getItInstance.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          getItInstance(), getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton<MilesRepository>(() => MilesRepositoryImpl(
    getItInstance(),
    getItInstance(),
    getItInstance(),
  ));


  getItInstance.registerLazySingleton<GetFeed>(
          () => GetFeed(getItInstance()));

  getItInstance.registerLazySingleton<GetTestimonials>(
          () => GetTestimonials(getItInstance()));


  getItInstance.registerSingleton<LoadingCubit>(LoadingCubit());

  getItInstance.registerSingleton<FeedCubit>(FeedCubit(
    getFeed: getItInstance()
  ));

  getItInstance.registerSingleton<TestimonialsCubit>(TestimonialsCubit(
    getTestimonials: getItInstance()
  ));
}