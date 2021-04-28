import 'package:flash_cards/notes/index.dart';
import 'package:flutter/material.dart';
import 'utils/StringUtils.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlashCards'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(30.0),
        child: Wrap(
            spacing: 20.0,
            children: subjects.keys
                .map((subject) => subjectCards(context, subject))
                .toList()),
      )),
    );
  }

  Widget subjectCards(BuildContext context, String subject) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 100,
        child: GestureDetector(
          onTap: () {
            print(subject);
            Navigator.pushNamed(context, "/subjects",
                arguments: {'subject': subject});
          },
          child: Card(
              color: Colors.yellow[300],
              child: Container(
                alignment: Alignment.center,
                // padding: const EdgeInsets.all(30.0),
                child: Text(subject.inCaps, style: TextStyle(fontSize: 30.0)),
              )),
        ));
  }
}
