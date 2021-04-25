import 'package:flutter/material.dart';

const subjects = ['javascript', 'html', 'react'];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FlashCards'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: Wrap(
              spacing: 20.0,
              children: subjects
                  .map((subject) => subjectCards(context, subject))
                  .toList()),
        ));
  }

  Widget subjectCards(BuildContext context, String subject) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 200,
        child: GestureDetector(
          // onHorizontalDragStart: (details) {
          //   print('Start');
          //   print(details);
          // },
          // onHorizontalDragUpdate: (DragUpdateDetails details) {
          //   print('update');
          //   print(details);
          // },
          // onHorizontalDragEnd: (details) {
          //   print('end');
          //   print(details);
          // },
          onTap: () {
            Navigator.pushNamed(context, "/$subject");
          },
          child: Card(
              color: Colors.yellow[300],
              child: Text(subject, style: TextStyle(fontSize: 40.0))),
        ));
  }
}
