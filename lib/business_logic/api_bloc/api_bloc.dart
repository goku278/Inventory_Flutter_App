import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:inventory_app2/repo/api_repository.dart';

import '../../model/items.dart';

part 'api_event.dart';

part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(DataInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetDataItems>((event, emit) async {
      debugPrint("Inside async...");
      emit(DataLoading());
      // try {

        final List<Items> list = await apiRepository.fetchItemsList(event.id);
        debugPrint("list => $list");
        emit(DataLoaded(listOfItems: list));
      // } catch (e) {
      //   debugPrint("e is => ${e.toString()}");
      // }
    });
  }
}
