import 'package:flutter/material.dart';


class profilepage extends StatefulWidget {
  const profilepage({Key key}) : super(key: key);

  @override
  _profilepageState createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(

              image: AssetImage("assets/images/profilepage.jpg"),
              fit: BoxFit. fitWidth,
              alignment: Alignment. topCenter,
            ),
          ),
        ),
      ),
    );
  }
}
