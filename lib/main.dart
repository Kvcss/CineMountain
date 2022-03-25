import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projetointegrado_e/Home.dart';
import 'package:projetointegrado_e/Login.dart';


void main ()async{

//aloaloalo

  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xb5d70e48),
    ),
    debugShowCheckedModeBanner: false,

  ));

}