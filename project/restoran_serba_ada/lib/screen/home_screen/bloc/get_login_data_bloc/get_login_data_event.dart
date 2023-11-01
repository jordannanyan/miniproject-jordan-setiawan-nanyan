part of 'get_login_data_bloc.dart';

sealed class GetLoginDataEvent extends Equatable {
  const GetLoginDataEvent();

  @override
  List<Object> get props => [];
}

final class GetUsernameEvent extends GetLoginDataEvent {
  final String data;

  const GetUsernameEvent({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}

final class GetPasswordEvent extends GetLoginDataEvent {
  final String data;

  const GetPasswordEvent({
    required this.data,
  });

  @override
  List<Object> get props => [data];
}
