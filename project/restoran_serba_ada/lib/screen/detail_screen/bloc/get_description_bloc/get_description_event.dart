part of 'get_description_bloc.dart';

sealed class GetDescriptionEvent extends Equatable {
  const GetDescriptionEvent();

  @override
  List<Object> get props => [];
}

final class GetMenuDescriptionAPIEvent extends GetDescriptionEvent {
  final String menu;

  const GetMenuDescriptionAPIEvent({
    required this.menu,
  });

  @override
  List<Object> get props => [menu];
}
