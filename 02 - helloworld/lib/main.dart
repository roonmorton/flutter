import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola Mundo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hola Mundo'),
        ),
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
  
}