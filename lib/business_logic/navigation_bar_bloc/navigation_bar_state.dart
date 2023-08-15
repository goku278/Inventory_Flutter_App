part of 'navigation_bar_bloc.dart';

@immutable
abstract class NavigationBarState {
  final int tabIndex;
  const NavigationBarState({required this.tabIndex});
}

class HomePageInitial extends NavigationBarState {
  const HomePageInitial({required super.tabIndex});
}