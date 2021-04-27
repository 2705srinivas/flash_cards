import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../notes/javascript/es6modules.dart';

class Notes extends StatefulWidget {
  @override
  PageState createState() => PageState();
}

class PageState extends State with TickerProviderStateMixin {
  AnimationController _animation;
  initState() {
    super.initState();
    _animation = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this, value: 0.1);
    _animation.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Javascript'),
        ),
        body: ScaleTransition(
            scale: _animation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.yellow[300]),
              child: Markdown(data: es6modules),
            )));
  }
}
