import 'package:flutter/material.dart';


class discoverpage extends StatefulWidget {
  const discoverpage({Key key}) : super(key: key);

  @override
  _discoverpageState createState() => _discoverpageState();
}

class _discoverpageState extends State<discoverpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
          image: DecorationImage(

          image: AssetImage("assets/images/discoverpage.jpg"),
      fit: BoxFit. fitWidth,
      alignment: Alignment. topCenter,
    ),
      ),
    ),
      ),
    );
  }
}
