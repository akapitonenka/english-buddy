import 'package:flutter/material.dart';
import 'package:english_buddy/models/product_model.dart';
import 'package:english_buddy/routes/route_names.dart';

List<String> getCategories(List<ProductModel> productList) {
  Set<String> setA = {};

  productList.forEach((el) {
    setA.add(el.category);
  });

  return setA.toList();
}

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getCategories(productsData).map((product) {
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.SubCategories.name,
                  arguments: product,
                );
              },
              splashColor: Colors.blue.withAlpha(30),
              child: Container(
                width: 300,
                height: 100,
                child: Text(product),
              ),
            ),
          );
        }).toList(),
      ),
    ),
    );
  }
}
