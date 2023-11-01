part of 'indicator_show_data_bloc.dart';

sealed class IndicatorShowDataEvent extends Equatable {
  const IndicatorShowDataEvent();

  @override
  List<Object> get props => [];
}

final class ChangeIndicatorShowDataEvent extends IndicatorShowDataEvent {
  final bool data;

  const ChangeIndicatorShowDataEvent({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
