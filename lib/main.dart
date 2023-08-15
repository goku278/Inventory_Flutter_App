import 'package:flutter/material.dart';
import 'package:inventory_app2/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      initialRoute: 'ContentDisplayPage',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
