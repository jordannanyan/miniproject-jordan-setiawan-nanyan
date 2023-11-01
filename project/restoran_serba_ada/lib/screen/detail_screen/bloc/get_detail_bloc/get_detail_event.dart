part of 'get_detail_bloc.dart';

sealed class GetDetailEvent extends Equatable {
  const GetDetailEvent();

  @override
  List<Object> get props => [];
}

final class GetDetailAPIEvent extends GetDetailEvent {
  final String id;

  const GetDetailAPIEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
