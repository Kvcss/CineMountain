import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Widgets/my_dots_app.dart';
import 'package:projetointegrado_e/Widgets/page_view_app.dart';
import 'Bomboniere.dart';


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
                          "https://s3-alpha-sig.figma.com/img/9990/e495/e624738c061210e2222c71f23dc82bce?Expires=1650844800&Signature=FRPtz9rZwqKmtEfD1zvJctOCAcfXz3r7LA0Wqn89Th3-CbT~e7EhmDQaJYN7bjjBFxgSz6ZXb58iE7aQ5wuz-cyz1bO25Ntu29r~6WFc7PdUU6wo8PZnIzCqSlTy57rRX0JlwP-P67UQcrPYVLQ6N0BZX7aA2BQbsUIYiFLJpG5RKcfuWE-5xW9kbWi39cSGte9YwvjhW8k~ubNFT84n7kgy7qXcW-geWTe-xUrkroDPfxm1iWCsl76u64LkLMTi4FF0ZgZjVVUQ800qfInKCzXtEOewh7osnqSoy~aBcM6vZHSmL8I9bxPJSnu6BjrIW-kCWWMim0Qyp1-vPLp1WQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Container(
                      width: 110,
                      color: Colors.pink,
                      child: Image.network(
                          "https://s3-alpha-sig.figma.com/img/9a26/26af/3a7b91d31c7f62151fec0276790f0ba2?Expires=1650844800&Signature=TNuYJUc7uepB7HhwwP~IgY6IhRtfAwZ3WQBET13MLqQi3yZO~Aa3ksEC0tjjeZ6WyNOzP7bwdl~X~pW9vFot7~7gqpgMx5TZ9y7lbp9toCsmuzqk28XyjnizWTtV274IvDOcuYBi8jVqPpOMU~k9Mh7n0tDApi7scsaNoFV7UkMa~zY4BIvrd9RzFtFK7wKSFnIUwvCFVOhipW3eVAtbD8iKt0Yq5CFCY2nbL8cH8BrTcvBwgSgSHYZ6RmErnCSV2AJfrBQcYN4TBtwCs5CqsY6wYeSLiMnRIgbrfpGlMCaKUY91WwUVh~p29sSo5pXcMaOIFp8S6Xhta0949u7fMw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
          )
        ],
      ),
    );
  }
}
