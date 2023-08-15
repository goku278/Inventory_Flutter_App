part of 'api_bloc.dart';

abstract class ApiState extends Equatable {
  @override
  List<Object> get props => [];
}

class DataInitial extends ApiState {}

class DataLoading extends ApiState {}

class DataLoaded extends ApiState {
  @override
  // TODO: implement props
  List<Object> get props => [listOfItems];

  final List<Items> listOfItems;

  DataLoaded({required this.listOfItems});
}

class DataError extends ApiState {}
