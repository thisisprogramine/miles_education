
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miles_education/src/domain/params/feed_params.dart';
import 'package:miles_education/src/domain/usecases/feed/get_feed.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/feed/feed_entity.dart';

part 'feed_state.dart';

class FeedCubit extends Cubit<FeedState> {
  final GetFeed getFeed;

  FeedCubit({
    required this.getFeed,
  })
      : super(FeedInitial());

  Future<void> loadFeed() async {
    emit(const FeedLoading());

    final Either<AppError, FeedEntity?> eitherGetFeed = await getFeed(const FeedParams(
        table: 'block',
        id: '11f3d626-2aa2-806c-8c0e-debca77c7929',
        spaceId: 'b56850fc-47bd-492c-a3da-2e8a8c5ddd0b',
        expirationTimestamp: '1730210400000',
        signature: 'OXhGJ-vmeE6LZ-JsNepBsL1MydV2ymuUr9bAOSpV5_U',
        downloadName: 'home_page.json'));

    eitherGetFeed.fold(
          (error) {
         emit(FeedError(errorType: error.appErrorType));
      }, (feed) {
        emit(FeedLoaded(
          feedData: feed?.feedData ?? []
        ));
      },
    );
  }
}
