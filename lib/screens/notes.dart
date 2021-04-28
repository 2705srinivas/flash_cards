import 'package:flash_cards/notes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Notes extends StatefulWidget {
  final String subject;
  final String notes;

  Notes(this.subject, this.notes);
  @override
  PageState createState() => PageState(subject, notes);
}

class PageState extends State with TickerProviderStateMixin {
  final String subject;
  final String notes;

  PageState(this.subject, this.notes);
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
          title: Text(subjects[subject].name),
        ),
        body: ScaleTransition(
            scale: _animation,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.yellow[300]),
              child: Markdown(data: subjects[subject].notes[notes][0]),
            )));
  }
}
