import 'dart:async';
import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:english_buddy/models/dictionary_word_model.dart';

part 'dictionary_store.g.dart';

class DictionaryStore = DictionaryStoreBase with _$DictionaryStore;

abstract class DictionaryStoreBase with Store {
  @observable
  ObservableList<DictionaryWordModel> dictionary = ObservableList.of([]);

  @computed
  int get numberOfDictionaryWords => dictionary.length;

  @action
  void addDictionaryWord(DictionaryWordModel newWord) {
    dictionary.add(newWord);

    _persistDictionaryWord(dictionary);
  }

  @action
  Future<void> initDictionary() async {
    await _getDictionary().then((onValue) {
      dictionary = ObservableList.of(onValue);
    });
  }

  void _persistDictionaryWord(List<DictionaryWordModel> updatedDictionaryWord) async {
    List<String> dictionaryStringList = [];
    SharedPreferences _preferences = await SharedPreferences.getInstance();

    for (DictionaryWordModel dictionaryWord in dictionary) {
      Map<String, dynamic> dictionaryWordMap = dictionaryWord.toJson();
      String dictionaryWordString = jsonEncode(DictionaryWordModel.fromJson(dictionaryWordMap));

      dictionaryStringList.add(dictionaryWordString);
    }

    _preferences.setStringList('dictionary', dictionaryStringList);
  }
  
  Future<List<DictionaryWordModel>> _getDictionary() async {
    final SharedPreferences _preferences = await SharedPreferences.getInstance();
    final List<String> dictionaryStringList = _preferences.getStringList('dictionary') ?? [];
    final List<DictionaryWordModel> retrievedDictionary = [];

    for (String dictionaryWordString in dictionaryStringList) {
      Map<String, dynamic> dictionaryWordMap = jsonDecode(dictionaryWordString);
      DictionaryWordModel dictionaryWord = DictionaryWordModel.fromJson(dictionaryWordMap);

      retrievedDictionary.add(dictionaryWord);
    }

    return retrievedDictionary;
  }
}
