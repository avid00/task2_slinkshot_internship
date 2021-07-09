import 'package:flutter/material.dart';


class postpage extends StatefulWidget {
  const postpage({Key key}) : super(key: key);

  @override
  _postpageState createState() => _postpageState();
}

class _postpageState extends State<postpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(

              image: AssetImage("assets/images/postpage.jpg"),
              fit: BoxFit. fitWidth,
              alignment: Alignment. topCenter,
            ),
          ),
        ),
      ),
    );
  }
}
