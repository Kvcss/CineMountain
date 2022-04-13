import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class Bomboniere extends StatefulWidget {
  const Bomboniere({Key? key}) : super(key: key);

  @override
  State<Bomboniere> createState() => _BomboniereState();
}

class _BomboniereState extends State<Bomboniere> {

  String UrlBebidas="";
  String UrlDoces="";
  String UrlPipocas = "";
  String UrlCombo = "";
  String mensagem = "";
  String NomeBebida = "";
  String NomeDoce = "";
  String NomePipoca = "";
  String NomeCombo = "";




  Future lerDados()async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('produtos');
    var result = await collection.get();

    for(var doc in result.docs){
      if(doc['nome'] == 'Bebidas'){
        UrlBebidas = doc['imagem'];
        NomeBebida = doc['nome'];
      }
      if(doc['nome'] == 'Doces'){
        UrlDoces = doc['imagem'];
        NomeDoce = doc['nome'];

      }
      if(doc['nome'] == 'Pipocas'){
        UrlPipocas = doc['imagem'];
        NomePipoca = doc['nome'];

      }
      if(doc['nome'] == 'Combo'){
        UrlCombo = doc['imagem'];
        NomeCombo = doc['nome'];

      }
    }

  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder(
            future: lerDados(),
            initialData: "Aguardando os dados...",
            builder: (context, snapshot) {
              return Container(
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
                            height: _screenHeight * .10,
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(right: 0),
                                      child: Text(
                                        "Bomboniere",
                                        style: TextStyle(
                                            fontSize: 38,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: _screenHeight * .018,
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                              color: Colors.black,
                              height: _screenHeight * .15,
                              child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: _screenHeight*.10,
                                        width: _screenHeight*.15,
                                        color: Colors.black,
                                        child: Image.network(UrlCombo),
                                      ),
                                      const  SizedBox(
                                        width: 50,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(NomeCombo,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                            ],

                                          ),
                                          Row(
                                            children:const <Widget>[
                                              Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                            ],
                                          ),
                                          Row(
                                            children:const <Widget>[
                                              Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(top: 5, bottom: 0),
                                                child: RaisedButton(
                                                  child: const Text(
                                                    "Eu quero",
                                                    style: TextStyle(color: Colors.white, fontSize: 15),
                                                  ),
                                                  color: Colors.pink,
                                                  padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(32)
                                                  ),
                                                  onPressed: (){
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.black,
                            height: _screenHeight*.15,
                            width: _screenHeight*.50,
                            child: Row(
                              children:<Widget>[
                                Container(
                                  color: Colors.black,
                                  height: _screenHeight*.10,
                                  width: _screenHeight*.15,
                                  child: Image.network(UrlPipocas),
                                ),
                                const SizedBox(
                                    width: 50
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(NomePipoca,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                      ],

                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                                          child: RaisedButton(
                                            child: const Text(
                                              "Eu quero",
                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                            ),
                                            color: Colors.pink,
                                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(32)
                                            ),
                                            onPressed: (){
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.black,
                            height: _screenHeight*.15,
                            width: _screenHeight*.50,
                            child: Row(
                              children:<Widget>[
                                Container(
                                  color: Colors.black,
                                  height: _screenHeight*.10,
                                  width: _screenHeight*.15,
                                  child: Image.network(UrlBebidas),
                                ),
                                const SizedBox(
                                    width: 50
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(NomeBebida,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                      ],

                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                                          child: RaisedButton(
                                            child: const Text(
                                              "Eu quero",
                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                            ),
                                            color: Colors.pink,
                                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(32)
                                            ),
                                            onPressed: (){
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),

                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            color: Colors.black,
                            height: _screenHeight*.15,
                            width: _screenHeight*.50,
                            child: Row(
                              children:<Widget>[
                                Container(
                                  color: Colors.black,
                                  height: _screenHeight*.10,
                                  width: _screenHeight*.15,
                                  child: Image.network(UrlDoces),
                                ),
                                const SizedBox(
                                    width: 50
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(NomeDoce,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),)
                                      ],

                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Selecione o tamanho da ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children:const <Widget>[
                                        Text("Preferencia",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white),)
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(top: 5, bottom: 0),
                                          child: RaisedButton(
                                            child: const Text(
                                              "Eu quero",
                                              style: TextStyle(color: Colors.white, fontSize: 15),
                                            ),
                                            color: Colors.pink,
                                            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(32)
                                            ),
                                            onPressed: (){
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: _screenHeight*.15,
                            width: _screenHeight*.50,
                            color: Colors.black,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                const SizedBox(
                                  width: 45,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  child: Container(
                                    width: 60,
                                    color: Colors.black,
                                    child: Image.network(
                                      "https://s3-alpha-sig.figma.com/img/3722/2e3d/e587a2104f0a3ed8c5cbab0c0e766481?Expires=1650844800&Signature=XbDT2MyMpMdiLKlzEpvdQUgbIExOQaknDRu8Aa2DatPlhwj2misgJsOk2NoxO3XKOKHgRvK8Fc8qFvzb-golh3Z1NZXKH6kClsc6qnsQl5jl8rKAnPPAUPVWJT5FeJ5Bm70xNpErCVdvp3z137S9a3huIOHPKa8RZRIsrC0EuIcjGv3beNPvx8cTm-d3JQzrY7eY5guuxBmm-ffKcCLpfUBepGWI5YV7VNhjccs77Yx9lLYjN43MTLw62D4r7uRf050LPE1fvFeUMIH29qQqAcWd3YCXe1YW5RBg5fQu2v3~-fuXTB3EVGoC-ir9lcJIi5sgBdpi8djsfyvwXI4NPA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 35,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  child: Container(
                                    child: Image.network(
                                      'https://cdn.discordapp.com/attachments/891605575975190589/958171706692866058/Design_sem_nome__3_-removebg-preview_1.png',
                                      height: 70,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    width: 60,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 35,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 12),
                                  child: Container(
                                      child: GestureDetector(
                                        child: Image.network(
                                          "https://s3-alpha-sig.figma.com/img/ac3d/dfb4/bdaf779c9ea32975413fab92807f2f7d?Expires=1650844800&Signature=JBRq0znHCaEWn60tmwP7dauDpcbLRCSZhQbmccHE-cwf4p05-NFZZb2AjJrbzqeOMO93uJEmbsUXcVEsTN5iP8tyQyyR7YTlIfR6PboBPiZGfux1JMtob2ICISoKf7zhu9RJzTfwsdZXABvNoCSfHWJEcjpKzGweslVr2JcDBBqAUYXUydL673mAuCgnHTPi1i1iFWKBCVHRzTfkRTd1c5gZ4hwAWOhMYlCuwQI9qmRQc-lhlQrbqhxpOW7YM1B6yvKUPo9BR2TPCWJ-8TbcrO-Kf4M3G1zEO2bSShgixG517H6z4hMFIUzQB~3EO8VdkqY61o5chGOssfLd-PBJwA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                                          color: Colors.white,
                                        ),
                                        onTap: () {
                                          lerDados();
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Bomboniere()));
                                        },
                                      ),
                                      width: 60,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
        )
    );
  }
}