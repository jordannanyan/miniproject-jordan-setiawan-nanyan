import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:restoran_serba_ada/model/api/open_ai_recommendation_api.dart';
import 'package:restoran_serba_ada/model/open_ai_model.dart';

part 'get_ai_recommendation_event.dart';
part 'get_ai_recommendation_state.dart';

class GetAiRecommendationBloc
    extends Bloc<GetAiRecommendationEvent, GetAiRecommendationState> {
  GetAiRecommendationBloc() : super(GetAiRecommendationInitial()) {
    on<GetAIMenuRecommendationEvent>((event, emit) async {
      await getRecommendation(event, emit);
    });
  }
  Future<void> getRecommendation(
    GetAIMenuRecommendationEvent event,
    Emitter<GetAiRecommendationState> emit,
  ) async {
    String data = event.data;
    emit(LoadingRecommendationState());
    final GptData recommendationData =
        await RecommendationService.getRecommendation(
      menu: data,
    );
    emit(
      ValueAIRecommendationState(
        data: recommendationData,
      ),
    );
  }
}
