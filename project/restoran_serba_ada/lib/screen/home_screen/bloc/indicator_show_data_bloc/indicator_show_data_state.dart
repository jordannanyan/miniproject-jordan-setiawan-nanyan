part of 'indicator_show_data_bloc.dart';

sealed class IndicatorShowDataState extends Equatable {
  const IndicatorShowDataState();

  @override
  List<Object> get props => [];
}

final class IndicatorShowDataInitial extends IndicatorShowDataState {}

final class ValueIndicatorShowDataState extends IndicatorShowDataState {
  final bool data;

  const ValueIndicatorShowDataState({required this.data});

  @override
  List<Object> get props => [data];
}
