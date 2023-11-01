part of 'get_ai_recommendation_bloc.dart';

sealed class GetAiRecommendationState extends Equatable {
  const GetAiRecommendationState();

  @override
  List<Object> get props => [];
}

final class GetAiRecommendationInitial extends GetAiRecommendationState {}

final class ValueAIRecommendationState extends GetAiRecommendationState {
  final GptData data;

  const ValueAIRecommendationState({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

final class LoadingRecommendationState extends GetAiRecommendationState {}
