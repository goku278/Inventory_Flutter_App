import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_app2/business_logic/navigation_bar_bloc/navigation_bar_bloc.dart';
import 'package:inventory_app2/screens/data_display_page.dart';

import 'data_input.dart';

List<BottomNavigationBarItem> bottomNavBarItems =
    const <BottomNavigationBarItem>[
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
  BottomNavigationBarItem(icon: Icon(Icons.grid_3x3), label: 'Category'),
  BottomNavigationBarItem(icon: Icon(Icons.search_outlined), label: 'search'),
  BottomNavigationBarItem(
      icon: Icon(Icons.favorite_outlined), label: 'Favourite'),
  BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag_outlined), label: 'Cart'),
];

const List<Widget> bottomNavScreen = <Widget>[
  // Text('Index 0: Home'),
  DataDisplayPage(),
  // Text('Index 1: Category'),
  DataInput(),
  Text('Index 2: Search'),
  // MyMusic(),
  Text('Index 3: Favourite'),
  Text('Index 4: Cart'),
];

class ContentDisplayPage extends StatelessWidget {
  const ContentDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: bottomNavScreen.elementAt(state.tabIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavBarItems,
            currentIndex: state.tabIndex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<NavigationBarBloc>(context)
                  .add(TabChanged(tabIndex: index));
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
