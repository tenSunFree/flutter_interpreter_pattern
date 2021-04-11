import 'package:flutter/material.dart';
import 'file:///C:/FlutterInterpreterPatternDemo/flutter_interpreter_pattern/lib/home/view/home_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterInterpreterPatternDemo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen());
  }
}
