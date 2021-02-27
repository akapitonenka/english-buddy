import 'package:flutter/material.dart';
import 'package:english_buddy/routes/route_generator.dart';
import 'package:english_buddy/routes/route_names.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.Home.name,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
