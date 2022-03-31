import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:projetointegrado_e/usuario/Login.dart';


void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: const Login(),
    theme: ThemeData(
      primaryColor: const Color(0xb5d70e48),
    ),
    debugShowCheckedModeBanner: false,

  ));

}