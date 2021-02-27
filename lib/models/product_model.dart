import 'package:flutter/material.dart';

class ProductModel {
  final String word;
  final String translation;
  final String category;
  final String subCategory;
  final int id;

  const ProductModel({
    @required this.word,
    @required this.translation,
    @required this.category,
    @required this.subCategory,
    @required this.id,
  });
}

List<ProductModel> productsData = [
  new ProductModel(word: 'cat', translation: 'кот', category: 'ELEMENTARY', subCategory: 'ANIMALS', id: 1),
  new ProductModel(word: 'dog', translation: 'собака', category: 'ELEMENTARY', subCategory: 'ANIMALS', id: 2),
  new ProductModel(word: 'cow', translation: 'корова', category: 'ELEMENTARY', subCategory: 'ANIMALS', id: 3),
  new ProductModel(word: 'floor', translation: 'пол', category: 'ELEMENTARY', subCategory: 'HOUSE', id: 4),
  new ProductModel(word: 'ceiling', translation: 'потолок', category: 'ELEMENTARY', subCategory: 'HOUSE', id: 5),
  new ProductModel(word: 'wall', translation: 'стена', category: 'ELEMENTARY', subCategory: 'HOUSE', id: 6),
  new ProductModel(word: 'author', translation: 'автор', category: 'PRE_INTERMEDIATE', subCategory: 'LITERATURE', id: 7)
];
