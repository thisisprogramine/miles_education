
import 'package:dartz/dartz.dart';
import 'package:miles_education/src/domain/params/feed_params.dart';

import '../../entities/app_error.dart';
import '../../entities/feed/feed_entity.dart';
import '../../repositories/miles_repository.dart';
import '../usecase.dart';

class GetFeed extends UseCase<FeedEntity?, FeedParams> {
  final MilesRepository _milesRepository;

  GetFeed(this._milesRepository);

  @override
  Future<Either<AppError, FeedEntity?>> call(FeedParams params) async =>
      _milesRepository.getFeeds(params: params.toJson());
}
