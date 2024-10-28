
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miles_education/src/domain/params/testimonial_params.dart';
import 'package:miles_education/src/domain/usecases/testimonials/get_testimonials.dart';

import '../../../domain/entities/app_error.dart';
import '../../../domain/entities/testimonials/testimonials_entity.dart';

part 'testimonials_state.dart';

class TestimonialsCubit extends Cubit<TestimonialsState> {
  final GetTestimonials getTestimonials;

  TestimonialsCubit({
    required this.getTestimonials,
  })
      : super(TestimonialsInitial());

  Future<void> loadTestimonials() async {
    emit(const TestimonialsLoading());

    final Either<AppError, TestimonialsEntity?> eitherGetTestimonials = await getTestimonials(const TestimonialParams(
        table: 'block',
        id: '11f3d626-2aa2-80f5-90b2-fb2a5cb3cda8',
        spaceId: 'b56850fc-47bd-492c-a3da-2e8a8c5ddd0b',
        expirationTimestamp: '1730210400000',
        signature: 'qxSzJkd0nfuxCeXxC1bcAjCdY8osSX1ZVgvyF0h2NQc',
        downloadName: 'testimonials.json'));

    eitherGetTestimonials.fold(
          (error) {
         emit(TestimonialsError(errorType: error.appErrorType));
      }, (testimonials) {
        emit(TestimonialsLoaded(
            testimonials: testimonials?.testimonialsdata ?? []
        ));
      },
    );
  }
}
