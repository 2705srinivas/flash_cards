import 'package:flash_cards/screens/modules.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'screens/notes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: _routes(), routes: {'/': (context) => Home()});
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      Map<String, dynamic> arguments = settings.arguments;
      switch (settings.name) {
        case "/":
          screen = Home();
          break;
        case "/subjects":
          screen = Modules(arguments['subject']);
          break;
        case "/notes":
          screen = Notes(arguments['subject'], arguments['note']);
          break;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
