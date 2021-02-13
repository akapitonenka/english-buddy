import 'package:flutter/material.dart';
import 'package:english_buddy/models/dictionary_word_model.dart';

class DictionaryWord extends StatelessWidget {
  final DictionaryWordModel dictionaryWord;
  final VoidCallback onPress;

  const DictionaryWord({
    Key key,
    @required this.dictionaryWord,
    this.onPress,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(dictionaryWord.word),
                ),
                Expanded(
                  child: Text(dictionaryWord.translation),
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
