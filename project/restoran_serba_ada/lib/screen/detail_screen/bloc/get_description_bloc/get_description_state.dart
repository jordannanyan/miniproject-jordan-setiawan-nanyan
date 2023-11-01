part of 'get_description_bloc.dart';

sealed class GetDescriptionState extends Equatable {
  const GetDescriptionState();

  @override
  List<Object> get props => [];
}

final class GetDescriptionInitial extends GetDescriptionState {}

final class ValueMenuDescriptionState extends GetDescriptionState {
  final GptData desc;

  const ValueMenuDescriptionState({
    required this.desc,
  });

  @override
  List<Object> get props => [desc];
}
