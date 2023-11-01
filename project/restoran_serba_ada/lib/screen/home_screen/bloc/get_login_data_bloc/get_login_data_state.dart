part of 'get_login_data_bloc.dart';

sealed class GetLoginDataState extends Equatable {
  const GetLoginDataState();

  @override
  List<Object> get props => [];
}

final class GetLoginDataInitial extends GetLoginDataState {}

final class ValueUsernameState extends GetLoginDataState {
  final String dataUsername;

  const ValueUsernameState({
    required this.dataUsername,
  });

  @override
  List<Object> get props => [dataUsername];
}

final class ValuePasswordState extends GetLoginDataState {
  final String data;

  const ValuePasswordState({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
