part of 'testimonials_cubit.dart';

abstract class TestimonialsState extends Equatable {
  const TestimonialsState();

  @override
  List<Object> get props => [];
}

class TestimonialsInitial extends TestimonialsState {}

class TestimonialsLoaded extends TestimonialsState {
  final List<TestimonialsData>? testimonials;
  const TestimonialsLoaded({required this.testimonials});

  @override
  List<Object> get props => [];
}

class TestimonialsError extends TestimonialsState {
  final AppErrorType errorType;

  const TestimonialsError({
    required this.errorType,
  });
}

class TestimonialsLoading extends TestimonialsState {
  const TestimonialsLoading();
}
