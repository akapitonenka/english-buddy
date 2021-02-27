import 'package:flutter/material.dart';
import 'package:english_buddy/models/product_model.dart';

List<String> getSubCategories(List<ProductModel> productList, String category) {
  Set<String> setA = {};

  productList.forEach((el) {
    if (el.category == category) {
      setA.add(el.subCategory);
    }
  });

  return setA.toList();
}

class SubCategoriesScreen extends StatefulWidget {
  final String category;

  SubCategoriesScreen({@required this.category});

  @override
  _SubCategoriesScreenState createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: getSubCategories(productsData, widget.category).map((product) {
          return Card(
            child: InkWell(
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
