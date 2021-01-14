import 'package:flutter/material.dart';
import 'package:startupnamegeneratorv2/screens/saved_sugestions.dart';
import 'package:startupnamegeneratorv2/screens/suggestions_list.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        accentColor: Colors.teal
      ),
      title: 'Startup Names Generator', //home: RandomWords()
      initialRoute: '/',
      routes: {
        '/': (context) => SuggestionsList(),
        '/saved-suggestions': (context) => SavedSuggestions(),
      },
    );
  }
}
