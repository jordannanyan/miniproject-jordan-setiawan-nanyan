part of 'get_database_bloc.dart';

sealed class GetDatabaseEvent extends Equatable {
  const GetDatabaseEvent();

  @override
  List<Object> get props => [];
}

final class GetAllHistoryEvent extends GetDatabaseEvent {}

final class AddHistoryEvent extends GetDatabaseEvent {
  final HistoryModel historyModel;

  const AddHistoryEvent({
    required this.historyModel,
  });

  @override
  List<Object> get props => [historyModel];
}

final class GetHistoryByIdEvent extends GetDatabaseEvent {
  final String id;

  const GetHistoryByIdEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

final class UpdateHistoryEvent extends GetDatabaseEvent {
  final HistoryModel historyModel;

  const UpdateHistoryEvent({
    required this.historyModel,
  });

  @override
  List<Object> get props => [historyModel];
}

final class DeleteHistoryByIdEvent extends GetDatabaseEvent {
  final String id;

  const DeleteHistoryByIdEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

final class InsertHistoryEvent extends GetDatabaseEvent {
  final HistoryModel historyModel;

  const InsertHistoryEvent({
    required this.historyModel,
  });

  @override
  List<Object> get props => [historyModel];
}
