
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Widgets/my_dots_app.dart';
import 'package:projetointegrado_e/Widgets/page_view_app.dart';
import 'Bomboniere.dart';
import 'EmCartaz.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex;
  String UrlBebidas="";
  String UrlDoces="";
  String UrlPipocas = "";
  String UrlCombo = "";
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }
  lerDados()async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('produtos');
    var result = await collection.get();

    for(var doc in result.docs){
      if(doc['nome'] == 'Bebidas'){
        UrlBebidas = doc['imagem'];
      }
      if(doc['nome'] == 'Doces'){
        UrlDoces = doc['imagem'];
      }
      if(doc['nome'] == 'Pipocas'){
        UrlPipocas = doc['imagem'];
      }
      if(doc['nome'] == 'Combo'){
        UrlCombo = doc['imagem'];
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Positioned(
            top: _screenHeight * .10,
            child: Container(
                color: Colors.black,
                height: 90,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'Lançamentos ⭐',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
          ),
          // HomeAux(),
          PageViewApp(
            top: _screenHeight * .20,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          MyDotsApp(
            top: _screenHeight * .63,
            currentIndex: _currentIndex,
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            height: _screenHeight * 0.15,
            child: Container(
              height: 150,
              color: Colors.black,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const SizedBox(
                    width: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Container(
                      width: 110,
                      color: Colors.pink,
                      child: Image.network(
                          "https://s3-alpha-sig.figma.com/img/9990/e495/e624738c061210e2222c71f23dc82bce?Expires=1653264000&Signature=R1xW9cmNx2I5R5g-fb6VAmfjONh9PDuOVAVMgTAby8BlVSSuwwiern90NBqjl~pw4aycPbPGBMMUlsBhWRBuxtqV86wpRw5LnHWcpKgCJkVr5US17PtR2H~Kv~9gxmXJ9K2rGLletY0wuF83h28Z1k2~v~tCRotcVuO8SM5AUVgaxRDOs9l3za~JfE3DoDntdywygWL6VFuVwkL0-Xmrpc-zwVtDN6nSz~2MhlKirHXzj3Ue0ygu6EF~Twd~fuwDtjHl6sMWQJbf0CWDRqDC1Q5JJ6rsPvLwsXeoUvXx9LiIkvR9igpZDMFEmxMnfJrPoJbooPllYjHrra9LI8bMUQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: GestureDetector(
                      child: Container(
                        width: 110,
                        color: Colors.pink,
                        child: Image.network(
                          "https://s3-alpha-sig.figma.com/img/9a26/26af/3a7b91d31c7f62151fec0276790f0ba2?Expires=1653264000&Signature=dP8QZMIfNIBd3MUrIE4UxFWE3ngq-c~ZiebA0~x-n1bvGYc85fgmzkxYEzrmlMDVPE3XLIB~wEDxPlYjRli4-Uidw9EIKMxywmGsaAGau5tNAtTC~YNwKbcnExSySLu-GcryK2Yjvurb~Wh-9wAjQAJiQwZ~ECg~jki-8Z3VeR2pCWBsg9nw92cKe3wjysLApb5mOa8BwSyXv6idYvo8Z-3Xoa2pcAa5DsRW7NPXYbiPBcNYwLz9-v41~afg~tXWEGZWfFsyhrLDpNtc8JCS~7Cy22RPTTa8P4P4nL0rHdrTigZGAfLUeCO6T43Vlfacko6MFOq~HL4hsCXE80wx~Q__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmCartaz()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 110,
              left: 0,
              right: 0,
              height: 51,
              child: Container(
                height: 1,
                color: Colors.black,
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 70),
                      child: Text(
                        'Pré-Compra',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 55),
                      child: Text(
                        'Em cartaz',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 80,
            child: Container(
              height: 5,
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
          )
        ],
      ),
    );
  }
}
