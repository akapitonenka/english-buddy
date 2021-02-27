import 'package:flutter/material.dart';

class LetterModel {
  final String letter;
  final int index;

  const LetterModel({ @required this.letter, @required this.index });

  factory LetterModel.fromJson(Map<String, dynamic> parsedJson) {
    return LetterModel(
      letter: parsedJson['letter'],
      index: parsedJson['index'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'letter': this.letter,
      'index': this.index,
    };
  }
}
