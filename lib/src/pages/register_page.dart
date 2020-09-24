import 'package:chat_app/src/helpers/mostrar_alertas.dart';
import 'package:chat_app/src/services/auth_service.dart';
import 'package:chat_app/src/widgets/button_green.dart';
import 'package:chat_app/src/widgets/custom_input.dart';
import 'package:chat_app/src/widgets/labels.dart';
import 'package:chat_app/src/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({Key key}) : super(key: key);

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
                Logo(titulo: 'Registro',),
                _FormLogin(),
                Label(ruta: 'login', titulo: '¿Ya tienes cuenta?', subTitulo: 'Inicia Sesion',),
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
  final nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 30),
       child: Column(
         children: [
           CustomInput(
             icon: Icons.perm_identity,
             placeholder: 'Usuario',
             keyboardType: TextInputType.text,
             textController: nameCtrl,
           ),
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
             onPressed: authService.autenticando ? null : () async {
               print(nameCtrl.text.trim());
               print(emailCtrl.text.trim());
               print(passCtrl.text.trim());
               FocusScope.of(context).unfocus();
               final registroOk = await authService.register(nameCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());
               if ( registroOk == true ) {
                 // Navegar a otra pantalla
                 Navigator.pushReplacementNamed(context, 'usuarios');
               } else {
                 //  mostrar alerta
                 mostrarAlerta(context, 'Registro Incorrecto', registroOk);
               }
             }, 
             text: 'REGISTRARSE',
           )
         ],
       ),
    );
  }
}

