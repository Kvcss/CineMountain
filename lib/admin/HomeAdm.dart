import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/admin/CadastroSessao.dart';
import '../usuario/Login.dart';
import 'CadastroFilmeAdm.dart';
import 'CadastroPreVendas.dart';
import 'cadastroSala.dart';
class HomeAdm extends StatefulWidget {
  const HomeAdm({Key? key}) : super(key: key);

  @override
  State<HomeAdm> createState() => _HomeAdmState();
}

class _HomeAdmState extends State<HomeAdm> {
  List<String> listaNome =[];
  List<String> listaSalas =[];
    listassociarArray()async{
    listaNome.clear();
    listaSalas.clear();
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('Filmes');
    var result = await collection.get();
    for(var doc in result.docs){
      setState(() {
        listaNome.add(doc['Nome do Filme']);
      });
    }
    var collectionSalas = FirebaseFirestore.instance.collection('Salas');
    var resultSalas = await collectionSalas.get();
    for(var doc1 in resultSalas.docs)
    {
      setState(() {
        listaSalas.add(doc1['Numero da Sala']);
      });
    }
   await Navigator.push(context, MaterialPageRoute(
        builder: (contex) => Sessao(listaNome,listaSalas)));
  }
  listassociarArray2()async{
    listaNome.clear();
    listaSalas.clear();
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('Filmes');
    var result = await collection.get();
    for(var doc in result.docs){
      setState(() {
        listaNome.add(doc['Nome do Filme']);
      });
    }
    var collectionSalas = FirebaseFirestore.instance.collection('Salas');
    var resultSalas = await collectionSalas.get();
    for(var doc1 in resultSalas.docs)
    {
      setState(() {
        listaSalas.add(doc1['Numero da Sala']);
      });
    }
    await Navigator.push(context, MaterialPageRoute(
        builder: (contex) => CadastroPreVendas(listaNome,listaSalas)));
  }


  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
      //  alignment: Alignment.topCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
                SizedBox(
                  height: _screenHeight *.1, //strech
                ),
                Container(
                  color: Colors.black,
                  height: _screenHeight * .10,
                  child:
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Padding(
                            padding : EdgeInsets.only(right: 0),
                            child: Text("Bem Vindo ao",
                                style: TextStyle(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                           children: const <Widget>[
                             Text("Cinemount", style: TextStyle(
                               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28
                             ),)
                           ],
                      )
                    ],
                  ),
                )
            ],
          ),
          Positioned(
            top: _screenHeight *.30,
            left: 0,
            child: Container(
              color: Colors.black,
              height: _screenHeight*.04,
              width: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:   const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 80),
                    child: Text("Selecione uma das ", style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28
                    )),
                  ),
                ],
            ),
          )
    ),
          Positioned(
              top: _screenHeight *.35,

              child: Container(
                color: Colors.black,
                height: _screenHeight*.04,
                width: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:   const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 90),
                      child: Text("op????es abaixo: ", style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28
                      )),
                    ),
                  ],
                ),
              )
          ),
          Positioned(
              top: _screenHeight *.43,
              left: 35,
              child: Padding(
                padding: const EdgeInsets.only(right: 0, bottom: 10),
                child: RaisedButton(
                  child: const Text(
                    "      Cadastrar novo filme      ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.pink,
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  onPressed: () {
                    setState(() {

                      Navigator.push(context, MaterialPageRoute(builder:(contex)=> CadastroFilme()));
                    });

                  },
                ),
              )
          ),
          Positioned(
              top: _screenHeight *.52,
              left: 35,
              child: Padding(
                padding: const EdgeInsets.only(right: 0, bottom: 10),
                child: RaisedButton(
                  child: const Text(
                    "      Cadastrar pr?? venda       ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.pink,
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  onPressed: () {
                    listassociarArray2();
                   // Navigator.push(context, MaterialPageRoute(builder:(contex)=> CadastroPreVendas()));
                  },
                ),
              )
          ),
          Positioned(
              top: _screenHeight *.61,
              left: 35,
              child: Padding(
                padding: const EdgeInsets.only(right: 0, bottom: 10),
                child: RaisedButton(
                  child: const Text(
                    "   Adicionar uma sala nova  ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.pink,
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder:(contex)=> CadastroSalas()));

                  },
                ),
              )
          ),
          Positioned(
              top: _screenHeight *.70,
              left: 35,
              child: Padding(
                padding: const EdgeInsets.only(right: 0, bottom: 10),
                child: RaisedButton(
                  child: const Text(
                    "          Criar uma se????o          ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.pink,
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  onPressed: (){
                    setState(() {
                        listassociarArray();
                    });



                  },
                ),
              )
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 100,
            child: Container(
              height: 10,
              color: Colors.black,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const SizedBox(
                    width: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: GestureDetector(
                      child: Container(
                          child:
                            Image.network('https://cdn.discordapp.com/attachments/891605575975190589/958171706692866058/Design_sem_nome__3_-removebg-preview_1.png'
                            ),
                        width: 200,
                        color: Colors.black,
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()));
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                ],
              ),
            ),
          )
    ],
      ),
    );
  }
}
