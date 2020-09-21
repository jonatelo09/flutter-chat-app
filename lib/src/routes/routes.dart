import 'package:chat_app/src/pages/chat_page.dart';
import 'package:chat_app/src/pages/loading_page.dart';
import 'package:chat_app/src/pages/login_page.dart';
import 'package:chat_app/src/pages/register_page.dart';
import 'package:chat_app/src/pages/usuarios_pade.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {

  'usuarios' : (_) => UsuariosPage(),
  'chat' : (_) => ChatPage(),
  'register' : (_) => RegisterPage(),
  'login' : (_) => LoginPage(),
  'loading' : (_) => LoadingPage(),

};