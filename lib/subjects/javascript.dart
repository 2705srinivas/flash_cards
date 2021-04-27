import 'package:flutter/material.dart';

class Javascript extends StatefulWidget {
  @override
  PageState createState() => PageState();
}

const values = [
  'one',
  'two',
  'three',
  'four',
  'five',
  'six',
  'seven',
  'eight',
  'nine'
];

class PageState extends State {
  int cardSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Javascript')),
        body: Container(
          child: _studyCard(context),
        ));
  }

  Widget _studyCard(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 200.0,
        child: Wrap(
            // scrollDirection: Axis.horizontal,
            children: values
                .map(
                  (value) => GestureDetector(
                      onTap: () {
                        setState(() {
                          cardSelected = 2;
                        });
                        Navigator.pushNamed(context, '/notes');
                      },
                      child: Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Card(
                              color: Colors.yellow[300], child: Text(value)))),
                )
                .toList()));
  }
}
