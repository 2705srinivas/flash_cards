import 'package:flutter/material.dart';
import 'home.dart';
import 'subjects/html.dart';
import 'subjects/javascript.dart';
import 'subjects/react.dart';
import 'subjects/notes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: _routes(), routes: {'/': (context) => Home()});
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      // Map<String, dynamic> arguments = settings.arguments;
      switch (settings.name) {
        case "/":
          screen = Home();
          break;
        case "/javascript":
          screen = Javascript();
          break;
        case "/html":
          screen = HTML();
          break;
        case "/react":
          screen = React();
          break;
        case "/notes":
          screen = Notes();
          break;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
