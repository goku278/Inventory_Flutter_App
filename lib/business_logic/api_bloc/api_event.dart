part of 'api_bloc.dart';

abstract class ApiEvent {
  const ApiEvent();
  @override
  List<Object> get props => [];
}

class GetDataItems extends ApiEvent {
  int id;
  GetDataItems({required this.id});

  @override
  List<Object> get props => [id];
}
