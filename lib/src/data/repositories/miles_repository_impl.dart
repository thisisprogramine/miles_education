
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:miles_education/src/data/datasource/remote/miles_remote_datasource.dart';

import '../../config/constants/response_constants.dart';
import '../../core/unathorised_exception.dart';
import '../../domain/entities/app_error.dart';
import '../../domain/repositories/miles_repository.dart';
import '../datasource/local/app_local_datasource.dart';
import '../datasource/local/miles_local_datasource.dart';
import '../models/feed/feed_model.dart';
import '../models/testimonials/testimonials_model.dart';

class MilesRepositoryImpl extends MilesRepository {
  final AppLocalDataSource _appLocalDataSource;
  final MilesLocalDataSource _milesLocalDataSource;
  final MilesRemoteDatasource _milesRemoteDataSource;

  MilesRepositoryImpl(this._appLocalDataSource, this._milesLocalDataSource, this._milesRemoteDataSource);

  @override
  Future<Either<AppError, FeedModel>> getFeeds({required Map<String, dynamic> params}) async{
    try {
      final response = await _milesRemoteDataSource.getFeeds(params: params);
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.database));
    } on UnauthorisedException {

      /* NOTE:
      * Sometimes the "expirationTimestamp" and "signature" parameters may expire or become invalid.
      * In such cases, I'm mocking a dummy response to ensure that the app can still load,
      *  even if the "expirationTimestamp" or "signature" has expired.
      *  This is done for testing purposes.
      */

      await Future.delayed(const Duration(milliseconds: 1000));
      return Right(ResponseConstants.feed);
      // return const Left(AppError(AppErrorType.unauthorised));
    } on Exception {

      /* NOTE:
      * Sometimes the "expirationTimestamp" and "signature" parameters may expire or become invalid.
      * In such cases, I'm mocking a dummy response to ensure that the app can still load,
      *  even if the "expirationTimestamp" or "signature" has expired.
      *  This is done for testing purposes.
      */

      await Future.delayed(const Duration(milliseconds: 1000));
      return Right(ResponseConstants.feed);
      // return const Left(AppError(AppErrorType.database));
    }
  }

  @override
  Future<Either<AppError, TestimonialsModel>> getTestimonials({required Map<String, dynamic> params}) async{
    try {
      final response = await _milesRemoteDataSource.getTestimonials(params: params);
      return Right(response);
    } on SocketException {
      return const Left(AppError(AppErrorType.database));
    } on UnauthorisedException {

      /* NOTE:
      * Sometimes the "expirationTimestamp" and "signature" parameters may expire or become invalid.
      * In such cases, I'm mocking a dummy response to ensure that the app can still load,
      *  even if the "expirationTimestamp" or "signature" has expired.
      *  This is done for testing purposes.
      */

      await Future.delayed(const Duration(milliseconds: 1000));
      return Right(ResponseConstants.story);
      // return const Left(AppError(AppErrorType.unauthorised));
    } on Exception {

      /* NOTE:
      * Sometimes the "expirationTimestamp" and "signature" parameters may expire or become invalid.
      * In such cases, I'm mocking a dummy response to ensure that the app can still load,
      *  even if the "expirationTimestamp" or "signature" has expired.
      *  This is done for testing purposes.
      */

      await Future.delayed(const Duration(milliseconds: 1000));
      return Right(ResponseConstants.story);
      // return const Left(AppError(AppErrorType.database));
    }
  }
}