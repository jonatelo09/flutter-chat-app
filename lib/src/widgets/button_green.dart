
import 'package:flutter/material.dart';


class ButtonGreen extends StatelessWidget {
  final String text;
  final Function onPressed;
  const ButtonGreen({
    Key key, 
    @required this.onPressed, 
    @required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Color.fromRGBO(138, 233, 184, 1.0),
      shape: StadiumBorder(),
      onPressed: this.onPressed,
      child: Container(
        width: double.infinity,
        child: Center(
          child: Text(this.text, 
          style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
            fontSize: 18,
          ),
        ),
      ),
      ),
  );
  }
}