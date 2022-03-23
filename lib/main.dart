import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() {

  //inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  Firestore.instance
      .collection("usuarios")
      .document("pontuacao")
      .setData({"Jamilton":"250"});

  runApp(MyApp());




}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
