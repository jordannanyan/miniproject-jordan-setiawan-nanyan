part of 'update_total_cost_bloc.dart';

sealed class UpdateTotalCostState extends Equatable {
  const UpdateTotalCostState();

  @override
  List<Object> get props => [];
}

final class UpdateTotalCostInitial extends UpdateTotalCostState {}

final class ValueTotalCostState extends UpdateTotalCostState {
  final int data;

  const ValueTotalCostState({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
