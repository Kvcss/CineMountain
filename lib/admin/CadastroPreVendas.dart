import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class CadastroPreVendas extends StatefulWidget {
  const CadastroPreVendas({Key? key}) : super(key: key);

  @override
  State<CadastroPreVendas> createState() => _CadastroPreVendasState();
}

class _CadastroPreVendasState extends State<CadastroPreVendas> {
  late List<String> listaNome;
  final dropValue = ValueNotifier('');
  String? value;



  associarArray()async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('Filmes');
    var result = await collection.get();
    int cont = 0;
    for(var doc in result.docs){
      listaNome[cont] = doc['Nome do Filme'];
   //   print(listaNome[0]);
      cont = cont +1;
    }
  }
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: _screenHeight * .1, //strech
                          ),
                          Container(
                            color: Colors.black,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 0),
                                      child: Text(
                                        "Cadastro de Pré",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 0),
                                      child: Text(
                                        "Venda",
                                        style: TextStyle(
                                            fontSize: 28,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: DropdownButton<String>(
                              items: listaNome.map(buildMenuItem).toList(),
                              onChanged: (value) =>
                                  setState(() => this.value = value),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            ),
    );

  }
  DropdownMenuItem<String> buildMenuItem(String listaNome) =>
      DropdownMenuItem(
        value: listaNome,
        child: Text(
          listaNome,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
