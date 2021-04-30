import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final String title;
  final Widget body;

  Layout(this.title, this.body);

  @override
  LayoutState createState() => LayoutState(title, body);
}

class LayoutState extends State with TickerProviderStateMixin {
  final String title;
  final Widget body;
  String menuState = 'close';
  AnimationController _openMenuController;
  Animation _openMenu;
  LayoutState(this.title, this.body);

  @override
  void initState() {
    super.initState();

    _openMenuController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));

    _openMenu = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(parent: _openMenuController, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(title),
            leading: GestureDetector(
                child: Icon(Icons.menu),
                onTap: () => {
                      setState(() {
                        if (menuState == 'open') {
                          menuState = 'close';
                          _openMenuController.reverse();
                        } else {
                          menuState = 'open';
                          _openMenuController.forward();
                        }
                      })
                    })),
        body: Stack(
          children: [body, menuBar(context)],
        ));
  }

  Widget menuBar(BuildContext context) {
    return AnimatedBuilder(
        animation: _openMenu,
        builder: (context, child) => Container(
            transform: Matrix4.translationValues(
                MediaQuery.of(context).size.width * (_openMenu.value - 1.0) / 3,
                0,
                0),
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.blue[500]),
            child: Column(
              children: [
                // Padding(padding: const EdgeInsets.fromLTRB(10, 60, 0, 0)),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.white))),
                  child: Text('One', style: TextStyle()),
                ),
              ],
            )));
  }
}
