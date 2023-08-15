import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app2/business_logic/api_bloc/api_bloc.dart';
import 'package:inventory_app2/business_logic/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:inventory_app2/screens/data_display_page.dart';
import 'package:inventory_app2/screens/navigation_bar_display_page.dart';

class RouteGenerator {
  final NavigationBarBloc navigationBarBloc = NavigationBarBloc();
  final ApiBloc apiBloc = ApiBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case 'ContentDisplayPage':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
                  BlocProvider<NavigationBarBloc>.value(value: navigationBarBloc,),
                  BlocProvider<ApiBloc>.value(
                    value: apiBloc,
                  )
                ], child: const ContentDisplayPage()));

      /* case 'MyHomePage':
          return _errorRoute();*/

      default:
        return _errorRoute();
    }
  }

  static _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
