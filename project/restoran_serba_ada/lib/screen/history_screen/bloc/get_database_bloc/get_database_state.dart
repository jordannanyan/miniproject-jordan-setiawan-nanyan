part of 'get_database_bloc.dart';

sealed class GetDatabaseState extends Equatable {
  const GetDatabaseState();

  @override
  List<Object> get props => [];
}

final class GetDatabaseInitial extends GetDatabaseState {}

final class ValueAllHistoryState extends GetDatabaseState {
  final List<HistoryModel> historyModel;

  const ValueAllHistoryState({
    required this.historyModel,
  });

  @override
  List<Object> get props => [historyModel];
}

final class ValueInsertHistoryState extends GetDatabaseState {
  final String message;

  const ValueInsertHistoryState({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

final class ValueGetHistoryByIdState extends GetDatabaseState {
  final HistoryModel historyModel;

  const ValueGetHistoryByIdState({
    required this.historyModel,
  });

  @override
  List<Object> get props => [historyModel];
}

final class ValueUpdateHistoryState extends GetDatabaseState {
  final List<HistoryModel> historyModel;

  const ValueUpdateHistoryState({
    required this.historyModel,
  });

  @override
  List<Object> get props => [historyModel];
}

final class ValueDeleteHistoryState extends GetDatabaseState {
  final List<HistoryModel> historyModel;

  const ValueDeleteHistoryState({
    required this.historyModel,
  });

  @override
  List<Object> get props => [historyModel];
}
