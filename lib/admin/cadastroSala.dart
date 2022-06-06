import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../model/Sala.dart';
import 'HomeAdm.dart';
class CadastroSalas extends StatefulWidget {
  const CadastroSalas({Key? key}) : super(key: key);

  @override
  State<CadastroSalas> createState() => _CadastroSalasState();
}

class _CadastroSalasState extends State<CadastroSalas> {
  final TextEditingController _controllerNumeroSala = TextEditingController();



  validarCadastro(){
    String Nsala = _controllerNumeroSala.text;
    String Tsala = valorEscolido!;

    Salas sala = Salas();
    sala.NumeroDaSala = Nsala;
    sala.TipoSala = Tsala;

    _adicionarPreVendas(sala);
  }

  _adicionarPreVendas(Salas salas)async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection("Salas");
    collection.doc().set(
        {
          'Numero da Sala': salas.NumeroDaSala,
          'Tipo da Sala' : salas.TipoSala,


        }
    );
    Navigator.push(context, MaterialPageRoute(builder: (contex) => HomeAdm()));
  }
  String? valorEscolido;
  List <String> listaNome = ['3D', '2D'];

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
                        Center(
                          child: Container(
                            color: Colors.black,
                            height: _screenHeight * .08,
                            width: _screenHeight * .20,
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              controller: _controllerNumeroSala,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  contentPadding:
                                  const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                  hintText: "Numero da Sala:",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                      const  SizedBox(
                          height: 40,
                        ),
                        Container(
                          height : 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Center(
                            child: DropdownButton<String>(

                              // hint: Text('Selecione o nome do Filme',style: TextStyle(color: Colors.black)),
                              dropdownColor: Colors.white,
                              value: valorEscolido,
                              hint: const Center(child:Text('Selecione o tipo da Sala', style: TextStyle(color: Colors.black,fontSize: 15),),),
                              style: TextStyle(color: Colors.white),
                              items: listaNome.map(buildMenuItem).toList(),
                              onChanged: (value)=> setState(() => valorEscolido = value),
                            ),

                          ),
                        ),
                        const SizedBox(
                          height: 280,
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
  DropdownMenuItem<String> buildMenuItem(String listaNome) =>
      DropdownMenuItem(
        value: listaNome,
        child: Text(
          listaNome,
          style: const TextStyle( fontSize: 15, color: Colors.black),
        ),

      );
}
