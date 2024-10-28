import 'package:dartz/dartz.dart';
import 'package:miles_education/src/domain/entities/testimonials/testimonials_entity.dart';

import '../entities/app_error.dart';
import '../entities/feed/feed_entity.dart';

abstract class MilesRepository {
  Future<Either<AppError, FeedEntity>> getFeeds({required Map<String, dynamic> params});
  Future<Either<AppError, TestimonialsEntity>> getTestimonials({required Map<String, dynamic> params});
}