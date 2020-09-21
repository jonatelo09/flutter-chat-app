import 'package:chat_app/src/widgets/button_green.dart';
import 'package:chat_app/src/widgets/custom_input.dart';
import 'package:chat_app/src/widgets/labels.dart';
import 'package:chat_app/src/widgets/logo.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: sizeScreen.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: 'Messenger',),
                _FormLogin(),
                Label(ruta: 'register', titulo: '¿No tienes cuenta?', subTitulo: 'Crea una ahora!',),
                Text('Términos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class _FormLogin extends StatefulWidget {

  @override
  __FormLoginState createState() => __FormLoginState();
}

class __FormLoginState extends State<_FormLogin> {

  final emailCtrl = TextEditingController();
  final passCtrl  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 30),
       child: Column(
         children: [

           CustomInput(
             icon: Icons.mail_outline,
             placeholder: 'Email',
             keyboardType: TextInputType.emailAddress,
             textController: emailCtrl,
           ),
           CustomInput(
             icon: Icons.lock_outline,
             placeholder: 'Password',
             textController: passCtrl,
             isPassword: true,
           ),
           ButtonGreen(
             onPressed: () {
               print(emailCtrl.text);
               print(passCtrl.text);
             }, 
             text: 'INGRESAR',
           )
         ],
       ),
    );
  }
}
