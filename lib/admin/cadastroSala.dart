import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../model/Sala.dart';
class CadastroSalas extends StatefulWidget {
  const CadastroSalas({Key? key}) : super(key: key);

  @override
  State<CadastroSalas> createState() => _CadastroSalasState();
}

class _CadastroSalasState extends State<CadastroSalas> {
  final TextEditingController _controllerNumeroSala = TextEditingController();
  final TextEditingController _controllerTipoSala = TextEditingController();
  final TextEditingController _controllerNumeroLinha= TextEditingController();
  final TextEditingController _controllerNumeroColuna = TextEditingController();
  validarCadastro(){
    String Nsala = _controllerNumeroSala.text;
    String Tsala = _controllerTipoSala.text;
    String Nlinha = _controllerNumeroLinha.text;
    String Ncoluna = _controllerNumeroColuna.text;
    Salas sala = Salas();
    sala.NumeroDaSala = Nsala;
    sala.TipoSala = Tsala;
    sala.NumeroLinhas = Nlinha;
    sala.NumeroColunas = Ncoluna;
    _adicionarPreVendas(sala);
  }

  _adicionarPreVendas(Salas salas)async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection("Salas");
    collection.doc().set(
        {
          'Numero da Sala': salas.NumeroDaSala,
          'Tipo da Sala' : salas.NumeroLinhas,
          'Numero de Colunas': salas.NumeroColunas,
          'Numero de Linhas': salas.NumeroLinhas,
        }
    );
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
                                      "Cadastro de ",
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
                                      "Salas",
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
                       const SizedBox(
                          height: 20,
                        ),
                      const  SizedBox(
                          height: 20,
                        ),
                        Row(
                            children : <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Container(
                                  color: Colors.black,
                                  height: _screenHeight * .08,
                                  width: _screenHeight * .15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: TextField(
                                     controller: _controllerNumeroSala,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(fontSize: 15),
                                      decoration: InputDecoration(
                                          contentPadding:
                                          const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                          hintText: "N Sala:",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10))),
                                    ),
                                  ),
                                ),
                              ),
                           const   SizedBox(
                                width: 90,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: Container(
                                  color: Colors.black,
                                  height: _screenHeight * .08,
                                  width: _screenHeight * .15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: TextField(
                                     controller: _controllerTipoSala,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(fontSize: 15),
                                      decoration: InputDecoration(
                                          contentPadding:
                                          const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                          hintText: "T Sala:",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10))),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      const  SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Container(
                              color: Colors.black,
                              height: _screenHeight * .08,
                              width: _screenHeight * .15,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: TextField(
                                  controller: _controllerNumeroLinha,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                      hintText: "N linhas:",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                ),
                              ),
                            ),
                          ),
                        ),  Center(
                          child: Padding(
                            padding: EdgeInsets.only(right: 0),
                            child: Container(
                              color: Colors.black,
                              height: _screenHeight * .08,
                              width: _screenHeight * .15,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: TextField(
                                  controller: _controllerNumeroColuna,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                      contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                      hintText: "N colunas:",
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                ),
                              ),
                            ),
                          ),
                        ),
                     const    SizedBox(
                          height: 200,
                        ),

                        Padding(
                          padding: EdgeInsets.all(0),
                          child: RaisedButton(
                            child: const Text(
                              "           Cadastrar           ",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            color: Colors.pink,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            onPressed: () {

                              validarCadastro();
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )

    );
  }
}
