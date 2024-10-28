
import 'package:dartz/dartz.dart';
import 'package:miles_education/src/domain/params/feed_params.dart';
import 'package:miles_education/src/domain/params/testimonial_params.dart';

import '../../entities/app_error.dart';
import '../../entities/feed/feed_entity.dart';
import '../../entities/testimonials/testimonials_entity.dart';
import '../../repositories/miles_repository.dart';
import '../usecase.dart';

class GetTestimonials extends UseCase<TestimonialsEntity?, TestimonialParams> {
  final MilesRepository _milesRepository;

  GetTestimonials(this._milesRepository);

  @override
  Future<Either<AppError, TestimonialsEntity?>> call(TestimonialParams params) async =>
      _milesRepository.getTestimonials(params: params.toJson());
}
