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
                                        child: Image.network("https://s3-alpha-sig.figma.com/img/1c97/54b5/48a0238d86e28b37fca2641772730fee?Expires=1653264000&Signature=XoOxfRT8UWfSbgPmDI-6WtMEAK9fcnSVQXyHtB2FD8D94C88D3r1iAn8ammOcG-uTXErFjlOL9nkEOs5e0i2uztl-1-MROpL-W5vw4F~CP0gkCO4pw8Hp9yu1GveIqwj3ustHAHMwAehG8s0pGXfQ-plFbMvB4Htfk6FBOk7dfeevbaGNmO~6NWY~eMyaMa4KNQjqxvzdMenAUAeO5BSlsNgxGcwf1sNvs~MPHFYNt2fvUgkOKulxgyUXhuMMJWowwT3m0~crWHutwsKQggy0~~cLcCYe2DdBGqbsdxjkoeqoagLAn5xp3n3tJeu9GDB2bJZj8BplE89ipVFyO2oVQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                                  child: Image.network("https://s3-alpha-sig.figma.com/img/e075/c0d6/f95e2160a8c09187c57e93d97175cff9?Expires=1653264000&Signature=goRsIGu7ra~V2paNMRigyAMXPvGIjRKk1PIh6~TEnn5VS~kiX9DUjHc-Hue4HsFxPSW2keq-Aomb-vv0RGvuVaiNjuvyi4LCUSMzarpDVA7r5B7sstLdTnGde-lA2hT50Fbk-udeURZZcVjPkNcZvgkiqPGzFytp6ShL6grg3f3Vca5D24683iIJaf8QKIefZ4ujnf1HAQy~z8Hp~4Q2O4FD3HvBrgp0yONyEU1UjOf82FKZrnFO6N-uAiuZrPuyOeVbvMq514ezImciuKjr7YU-rEGU-kO8ZJG89ff-zKNKD2PgTEg44o1-Y-i1Y2J2zvgAwv2HyLcGBQJwmbav1Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                                  child: Image.network("https://s3-alpha-sig.figma.com/img/c1c9/6b5c/7069e046c99e72e17349b6e9667233ec?Expires=1653264000&Signature=gPTf8AFC8vybWCjW3jjxL8YKGz-Jie-dx1vuq9-JKbjmL5EqAlSXPCE54MZVsIzgEk9SAQKRC3-0LDCYOa~nkYT-Mfo9uDU7B148qKkdSEVI~-yGBvbcXtvjqxcR2cBPVNloCAhGpyo7jbaphM6pEv5hrDcxtQIESTKg~aJpWRiT6ydoffeWKkJlQRu27nEjMB6sxlo~5vLo9st1taYOuuqSlxBMCbPMbA3rfkW9xn41eJHGvqvRE06GdjZX-xRuf6U7W9VAsq9G-M-x0OH9Exw-6fbGS3DgDpfKgW4~OjMh4PX8drswhy0BH1FM5pmeg3yW4n~PlKY37vLqASrV9g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                                  child: Image.network("https://s3-alpha-sig.figma.com/img/27e2/fd15/cb2397fe78cfe7c89a0124bd5bdcb5b0?Expires=1653264000&Signature=dyLcpFEpIzmnytq~JRDXaLpqd-o9cGuPCyix-V89yyWcLchtTp1kO2joYajjZ5wugSHbJtxmSGi7Kas2mM3l6IFSKjqi24ltZvXnSoT1KUaPMoHuTrFMyPwWEt3vF6ZO-9zZEfwvtdHN8sLjFXzgaFpqlUUI1s38xCJlVmK3bZtaCGUG6S2H7dJsOERrMlh0cogjrK~0NgWvwgWgLNBcD6xsXBQTmH8Izk~BNu99yXCY-v3-8uoGk2cPBoF61sH~kEkdSZewpUj2rOTx8YsbODvXgWPWU0IFDpXbVpEMgE2u3XooTImVBCwTnahFQh7~xwbD6YuK-nnEQX6xv1tUHw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                                      "https://s3-alpha-sig.figma.com/img/3722/2e3d/e587a2104f0a3ed8c5cbab0c0e766481?Expires=1653264000&Signature=CQySErbSk-~VrB3v0kUlYkzr-bk6dp77yS9SOJY2N8wtzz1GaDi6NM0WHwOLqxzCZrjlzV5mR5rJbLLv9XusxX6BKte5HAO0UZ-cO3kh169mjqxQQtmYQ4OxnXQQSZkEwJ3ehGC2UMU-SmeYbPXql4uKDsJDgmQhyM08U2tbgiPp45Nny43yr6kcexZhaZBeLGdZXrMfm7xfiKtkdAy-nCtXaWLp3vPAF~3Rb~QDnIltYIVxTbeSNLRVJTCPPkDoqz9is06tI0fqKQv7elgMMXINCr9LCRvBzfEAcP-USpGQpjy7~dQ57Oq1Scs04iHsrbZ9NcLpvSFfZi5zJPLKuA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
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
                                          "https://s3-alpha-sig.figma.com/img/ac3d/dfb4/bdaf779c9ea32975413fab92807f2f7d?Expires=1653264000&Signature=Vm6Y0dptdi9MbjFTSfopG3aKefMpYzQCayhx3Kj1zdTYZH2ooKq-rbpW8k-uNPASsmlSLfZyl57~A-AqAHjx2kmfMG6Hs4WGOqGOHEWSOaADDWVfXATMgoF4pa5pgE9oZ-XfVKpsLbWcaVyE77LwARo1pmbhuQbQdxWZbXlgwotW1lnXXhjQGSjEUNQeN~Y7qZx3LMdGswzwS5lTaJNcVm65YWRCOmWGcXqbEmaaKhkp4Hyi40JLpnwzzZEu0PZ0v6EU0GxNRmgA7TNmsMPLXxuzQFyDKATLirEHIO35pRiGfbOPLCAjo9PvPIJcHVzkqMr~NRNCudtkZKXM3aKxHQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
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