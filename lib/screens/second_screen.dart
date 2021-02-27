import 'dart:math';
import 'package:english_buddy/models/dictionary_word_model.dart';
import 'package:english_buddy/models/letter_model.dart';
import 'package:flutter/material.dart';

List shuffle(array) {
  final rng = new Random();

  for (var i = array.length - 1; i > 0; i--) {
    final j = (rng.nextDouble() * (i + 1)).floor();
    final t = array[i];
    array[i] = array[j];
    array[j] = t;
  }
}

String getText(int length) {
  String text = '';
  const String alph = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  final rng = new Random();

  for (var i = 0; i < length; i++) {
    final position = (rng.nextDouble() * alph.length).floor();
    text += alph[position];
  }

  return text;
}

class SecondScreen extends StatefulWidget {
  final DictionaryWordModel dictionaryWord;

  SecondScreen({@required this.dictionaryWord});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int activeIndex = 0;
  List<String> list;
  List<LetterModel> list1;

  @override
  void initState() {
    String text = getText(15 - widget.dictionaryWord.translation.length);
    list = widget.dictionaryWord.translation.split('') + text.split('');
    shuffle(list);
    list1 = List.generate(widget.dictionaryWord.translation.length,
        (index) => LetterModel(letter: null, index: null));
    super.initState();
  }

  String getTextFromList(List<LetterModel> array) {
    final a = array.map((e) => e.letter).join();
    return a;
  }

  @override
  Widget build(BuildContext context) {
    final a = getTextFromList(list1);

    if (a == widget.dictionaryWord.translation) {
      // showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog();
      //     });
    }

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('123'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.dictionaryWord.word,
                        style: TextStyle(fontSize: 50),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: list1
                              .asMap()
                              .entries
                              .map((e) => WordTile(
                                    text: e.value.letter,
                                    onClick: () {
                                      setState(() {
                                        activeIndex = e.key;
                                        list[e.value.index] = e.value.letter;
                                        list1[e.key] = LetterModel(
                                            letter: null, index: null);
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: list
                        .asMap()
                        .entries
                        .map((e) => Tile(
                              text: e.value,
                              onClick: () {
                                setState(() {
                                  list[e.key] = null;
                                  list1[activeIndex] = LetterModel(
                                      letter: e.value, index: e.key);
                                  activeIndex++;
                                });
                              },
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  Tile({@required this.text, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return text == null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
            ),
          )
        : GestureDetector(
            onTap: onClick,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.red,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          );
  }
}

class WordTile extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  WordTile({@required this.text, @required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              left: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
              bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
            ),
          ),
          child: Center(
            child: Text(
              text ?? '',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}
