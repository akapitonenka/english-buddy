import 'package:meta/meta.dart';

class DictionaryWordModel {
  final String word;
  final String translation;

  const DictionaryWordModel({ @required this.word, @required this.translation });

  factory DictionaryWordModel.fromJson(Map<String, dynamic> parsedJson) {
    return DictionaryWordModel(
      word: parsedJson['word'],
      translation: parsedJson['translation'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'word': this.word,
      'translation': this.translation,
    };
  }
}
