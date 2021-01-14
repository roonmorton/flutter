import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startupnamegeneratorv2/screens/saved_sugestions.dart';

class SuggestionsList extends StatefulWidget {
  @override
  SuggestionsListState createState() => SuggestionsListState();
}

class SuggestionsListState extends State<SuggestionsList> {
final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0);
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Names Generator List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
          ),
          IconButton(
            icon: Icon(Icons.list),
            onPressed: (){
              Navigator.pushNamed(context, '/saved-suggestions', arguments: ScreenArguments(
                _saved
              ));
            },
          )
        ],
      ),
      body: _buildSuggestions(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: () {
          setState(() {
            _addSugestion();
          });
        },
      ),
    );
  }



  _addSugestion() {
    if (_suggestions.length.isOdd) _suggestions.add(WordPair.random());
    _suggestions.add(WordPair.random());
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
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved)
            _saved.remove(pair);
          else
            _saved.add(pair);
        });
      },
    );
  }
}