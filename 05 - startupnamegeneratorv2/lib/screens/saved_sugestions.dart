import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedSuggestions extends StatefulWidget {
  @override
  SavedSuggestionsState createState() => SavedSuggestionsState();
}

class SavedSuggestionsState extends State<SavedSuggestions> {
  final List<WordPair> _suggestions = <WordPair>[];
  //final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);


  @override
  Widget build(BuildContext context) {
    
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    Set<WordPair> _saved = args.words;
    final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
      return ListTile(
        title: Text(pair.asPascalCase, style: _biggerFont),
      );
    });
    final List<Widget> divided =
        ListTile.divideTiles(tiles: tiles, context: context).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('Saved Suggestions'),
        ),
        body: ListView(children: divided));
  }
}


class ScreenArguments {
  final Set<WordPair> words;
  ScreenArguments(this.words);
}