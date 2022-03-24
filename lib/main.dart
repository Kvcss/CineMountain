import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{

  //inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;


 db
      .collection("usuarios")
      .doc("pontuacao")
      .set({"Jamilton":"250", "Ana": "590"});


  runApp(MyApp());




}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
