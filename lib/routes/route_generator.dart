import 'package:flutter/material.dart';
import 'package:english_buddy/routes/route_names.dart';
import 'package:english_buddy/screens/dictionary_screen.dart';
import 'package:english_buddy/screens/second_screen.dart';
import 'package:english_buddy/screens/categories_screen.dart';
import 'package:english_buddy/screens/sub_categories_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    if (settings.name == RouteName.Home.name) {
      return MaterialPageRoute(builder: (context) => DictionaryScreen());
    } else if (settings.name == RouteName.Second.name) {
      return MaterialPageRoute(builder: (context) => SecondScreen(
        dictionaryWord: args,
      ));
    } else if (settings.name == RouteName.Categories.name) {
      return MaterialPageRoute(builder: (context) => CategoriesScreen());
    } else if (settings.name == RouteName.SubCategories.name) {
      return MaterialPageRoute(builder: (context) => SubCategoriesScreen(
        category: args,
      ));
    } else {
      return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
          centerTitle: true,
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
