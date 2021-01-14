import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Startup name generator v1', home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  ListView list = ListView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup name Generator'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Text("Item counter: " + _suggestions.length.toString(),
                  style: TextStyle(fontSize: 22))),
          Expanded(
            child: _buildSuggestions(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_comment),
        onPressed: () {
          setState(() {
            if (_suggestions.length.isOdd) _suggestions.add(WordPair.random());
            _suggestions.add(WordPair.random());
          });
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          /* if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(1)); 
          } */
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
