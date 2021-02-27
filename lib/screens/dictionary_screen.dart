import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:english_buddy/routes/route_names.dart';
import 'package:english_buddy/store/dictionary_store.dart';
import 'package:english_buddy/models/dictionary_word_model.dart';
import 'package:english_buddy/widgets/dictionary_word.dart';

class DictionaryScreen extends StatefulWidget {
  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<DictionaryScreen> {
  final DictionaryStore _dictionaryStore = DictionaryStore();
  final TextEditingController _wordController = TextEditingController();
  final TextEditingController _translationController = TextEditingController();

  @override
  void initState() {
    _dictionaryStore.initDictionary();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Review App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 12.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: screenWidth * 0.6,
                  child: TextField(
                    controller: _wordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Write a word1",
                      labelText: "Write a word1",
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.6,
                  child: TextField(
                    controller: _translationController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Write a translation",
                      labelText: "Write a translation",
                    ),
                  ),
                ),
                Container(
                  child: Builder(
                    builder: (BuildContext context) {
                      return IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () {
                          if (_wordController.text.isEmpty || _translationController.text.isEmpty) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("You can't!"),
                              duration: Duration(milliseconds: 500),
                            ));
                          } else {
                            _dictionaryStore.addDictionaryWord(DictionaryWordModel(
                              word: _wordController.text,
                              translation: _translationController.text,
                            ));
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: Container(
                child: Observer(
                  builder: (_) => _dictionaryStore.dictionary.isNotEmpty
                    ? ListView(
                        children: _dictionaryStore.dictionary.reversed
                          .map((dictionaryWord) => DictionaryWord(
                            dictionaryWord: dictionaryWord,
                            onPress: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.Second.name,
                                arguments: dictionaryWord,
                              );
                            },
                          ))
                          .toList(),
                      )
                    : Text("No dictionary yet"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
