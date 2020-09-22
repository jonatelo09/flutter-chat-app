import 'dart:io';

import 'package:chat_app/src/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ChatPage extends StatefulWidget {

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {

  final _textController = TextEditingController();
  final _focusNode = new FocusNode();

  List<ChatMessage> _message = [

  ];
  bool _estaEscribiendo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text('Te', style: TextStyle(fontSize: 12),),
              backgroundColor: Colors.blue[100],
              maxRadius: 14,
            ),
            SizedBox(height: 3,),
            Text('Jonatan Arevalo', style: TextStyle(color: Colors.black87, fontSize: 12))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: _message.length,
                itemBuilder: (_,i) => _message[i],
                reverse: true,
              )
            ),
            Divider( height: 1,),

            Container(
              color: Colors.white,
              height: 100,
              child: _inputChat()
            )
          ],
        ),
      ),
   );
  }

  Widget _inputChat() {

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: ( String texto ) {
                  setState(() {
                    if( texto.trim().length > 0){
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });

                },
                decoration: InputDecoration.collapsed(
                  hintText: 'Enviar mensaje...'
                ),
                focusNode: _focusNode,
              )
            ),
            
            // Boton de enviar
            Container(
              margin: EdgeInsets.symmetric( horizontal:  4.0 ),
              child: Platform.isAndroid
              ? Container(
                child: IconTheme(
                  data: IconThemeData( color: Colors.blue[400]),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      Icons.send, 
                    ), 
                    onPressed: _estaEscribiendo
                    ? () => _handleSubmit(_textController.text.trim())
                    : null,
                  ),
                ),
              )
              : CupertinoButton(
                child: Text('Enviar'), 
                onPressed: _estaEscribiendo
                ? () => _handleSubmit(_textController.text.trim())
                : null,
                ),
            )
          ],
        ),
      )
    );
  }

  _handleSubmit(String texto ) {
    if ( texto.length == 0) return;
    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = new ChatMessage(
      uid: '123', 
      texto: texto,
      animationController: AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400)
      ),
    );
    _message.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // TODO: Off del socket

    for( ChatMessage message in _message) {
      message.animationController.dispose();  // Limpiar cada uno de los animationcontroller
    }
    super.dispose();
  }
}