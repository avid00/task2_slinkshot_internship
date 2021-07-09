import 'package:flutter/material.dart';


class searchpage extends StatefulWidget {
  const searchpage({Key key}) : super(key: key);

  @override
  _searchpageState createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(

              image: AssetImage("assets/images/searchpage.jpg"),
              fit: BoxFit. fitWidth,
              alignment: Alignment. topCenter,
            ),
          ),
        ),
      ),
    );
  }
}
