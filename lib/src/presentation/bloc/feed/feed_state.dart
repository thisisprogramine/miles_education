part of 'feed_cubit.dart';

abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

class FeedInitial extends FeedState {}

class FeedLoaded extends FeedState {
  final List<FeedData>? feedData;
  const FeedLoaded({required this.feedData});

  @override
  List<Object> get props => [];
}

class FeedError extends FeedState {
  final AppErrorType errorType;

  const FeedError({
    required this.errorType,
  });
}

class FeedLoading extends FeedState {
  const FeedLoading();
}
