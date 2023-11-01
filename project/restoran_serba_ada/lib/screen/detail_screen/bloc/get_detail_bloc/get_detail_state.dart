part of 'get_detail_bloc.dart';

sealed class GetDetailState extends Equatable {
  const GetDetailState();

  @override
  List<Object> get props => [];
}

final class GetDetailInitial extends GetDetailState {}

final class ValueDetailMealState extends GetDetailState {
  final List<Meal> data;

  const ValueDetailMealState({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
