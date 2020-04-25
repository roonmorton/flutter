import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Startup Name Generator', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() {
    return RandomWordState();
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Startup Name Generator',
          textAlign: TextAlign.right,
        ),
      ),
      body: _buildSuggestios(),
    );
  }

  Widget _buildSuggestios() {
    return ListView.builder(itemBuilder: (context, index) {
      if(index.isOdd) return Divider();

      index = index ~/ 2;
      if (index <= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(title: Text(pair.asPascalCase));
  }
}
