import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final String titulo;

  const Logo({Key key,@required this.titulo}) : super(key: key);


  
  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: sizeScreen.width * 0.40,
        child: Column(
          children: [
            Image( image: AssetImage('assets/logo-chat.png'),),
            SizedBox(height: 20,),
            Text(this.titulo, style: TextStyle(fontSize: 25),)
          ],
        ),
        
      ),
    );
  }
}