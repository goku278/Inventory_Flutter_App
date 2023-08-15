part of 'navigation_bar_bloc.dart';

@immutable
abstract class NavigationBarEvent {
}

class TabChanged extends NavigationBarEvent {
  int tabIndex;
  TabChanged({required this.tabIndex});
}
