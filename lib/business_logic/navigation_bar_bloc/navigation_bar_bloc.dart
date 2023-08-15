import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(const HomePageInitial(tabIndex: 0)) {
    on<NavigationBarEvent>((event, emit) {
        if (event is TabChanged) {
          emit (HomePageInitial(tabIndex: event.tabIndex));
        }
    });
  }
}
