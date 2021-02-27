// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DictionaryStore on DictionaryStoreBase, Store {
  Computed<int> _$numberOfDictionaryWordsComputed;

  @override
  int get numberOfDictionaryWords => (_$numberOfDictionaryWordsComputed ??=
          Computed<int>(() => super.numberOfDictionaryWords,
              name: 'DictionaryStoreBase.numberOfDictionaryWords'))
      .value;

  final _$dictionaryAtom = Atom(name: 'DictionaryStoreBase.dictionary');

  @override
  ObservableList<DictionaryWordModel> get dictionary {
    _$dictionaryAtom.reportRead();
    return super.dictionary;
  }

  @override
  set dictionary(ObservableList<DictionaryWordModel> value) {
    _$dictionaryAtom.reportWrite(value, super.dictionary, () {
      super.dictionary = value;
    });
  }

  final _$initDictionaryAsyncAction =
      AsyncAction('DictionaryStoreBase.initDictionary');

  @override
  Future<void> initDictionary() {
    return _$initDictionaryAsyncAction.run(() => super.initDictionary());
  }

  final _$DictionaryStoreBaseActionController =
      ActionController(name: 'DictionaryStoreBase');

  @override
  void addDictionaryWord(DictionaryWordModel newWord) {
    final _$actionInfo = _$DictionaryStoreBaseActionController.startAction(
        name: 'DictionaryStoreBase.addDictionaryWord');
    try {
      return super.addDictionaryWord(newWord);
    } finally {
      _$DictionaryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dictionary: ${dictionary},
numberOfDictionaryWords: ${numberOfDictionaryWords}
    ''';
  }
}
