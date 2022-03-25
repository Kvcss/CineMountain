import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projetointegrado_e/Home.dart';


void main ()async{

  //inicializar o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
//aloaloalo

  db
      .collection("usuarios")
      .doc("pontuacao")
      .set({"Jamilton":"250", "Ana": "590"});
      //.doc()


  runApp(MaterialApp(
    home: Home(),debugShowCheckedModeBanner: false,

  ));

}