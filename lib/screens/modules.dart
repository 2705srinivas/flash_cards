import 'package:flash_cards/notes/index.dart';
import 'package:flutter/material.dart';

class Modules extends StatefulWidget {
  final String subject;

  Modules(this.subject);

  @override
  PageState createState() => PageState(subject);
}

class PageState extends State {
  int cardSelected;
  String subject;

  PageState(this.subject);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(subjects[subject].name)),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(30.0),
        child: _studyCard(context, subject),
      )),
    );
  }

  Widget _studyCard(BuildContext context, String subject) {
    return Container(
        child: Wrap(
            children: subjects[subject]
                .notes
                .keys
                .map(
                  (value) => Container(
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/notes',
                                arguments: {'subject': subject, 'note': value});
                          },
                          child: Card(
                              color: Colors.yellow[300],
                              child: Container(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Text(value,
                                      style: TextStyle(fontSize: 30.0)))))),
                )
                .toList()));
  }
}
