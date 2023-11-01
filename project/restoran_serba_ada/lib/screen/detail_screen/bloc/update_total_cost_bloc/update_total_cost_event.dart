part of 'update_total_cost_bloc.dart';

sealed class UpdateTotalCostEvent extends Equatable {
  const UpdateTotalCostEvent();

  @override
  List<Object> get props => [];
}

final class GetTotalCostEvent extends UpdateTotalCostEvent {
  final int data;

  const GetTotalCostEvent({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
