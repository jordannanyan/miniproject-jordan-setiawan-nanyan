part of 'get_ai_recommendation_bloc.dart';

sealed class GetAiRecommendationEvent extends Equatable {
  const GetAiRecommendationEvent();

  @override
  List<Object> get props => [];
}

final class GetAIMenuRecommendationEvent extends GetAiRecommendationEvent {
  final String data;

  const GetAIMenuRecommendationEvent({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
