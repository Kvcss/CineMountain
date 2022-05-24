
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Widgets/my_dots_app.dart';
import 'package:projetointegrado_e/Widgets/page_view_app.dart';
import 'Bomboniere.dart';
import 'EmCartaz.dart';
import 'prevenda.dart';


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
                    child: GestureDetector(
                      child: Container(
                        width: 110,
                        color: Colors.pink,
                        child: Image.network(
                            "https://s3-alpha-sig.figma.com/img/9990/e495/e624738c061210e2222c71f23dc82bce?Expires=1654473600&Signature=QKUnVHBKUzh9BoEUqByte4s4bOUJmd7d4yIrNElUUEAN5EwRoOvYL0R3rcsDPkoUdVyyQg~okvA80b1L5V5Iv1pAa4nfsHpcmYfvuheYmORni0pXikmpKFE1IGNZut85uucO~6zfHxhjywssrjcPMd3Zl00NuZBc-pkaJjrKiKE3uIKCHX4RzWf99xHWp24U2WLVLUgIsVdiIFhBodHec4YLeCSH2LI0cd0GeEmMJmWr2a8x1bItd4-R8~WYhSLWhv9kwkl48yndtaO5s~LnYkOclk0CBHDjuMK2-l1pl16UPC4dVraKTX1bHrBG8OgXuU9EmAMQCvvUvHfIycof2A__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => prevenda()));
                      },
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
                          "https://s3-alpha-sig.figma.com/img/9a26/26af/3a7b91d31c7f62151fec0276790f0ba2?Expires=1654473600&Signature=XWo77hFMgPIQySkvqldLJLVIH6516LlLKMLaSVt5Rs54GhVdSj~aL6aECGPgtJbstBdiYD0KCP262SpBbw-UfNt~AnAyPJQFCHCIKuJ68aaQhpU-FscvjK3JLAhG1mzpiI7n~-LDYoCFTshAz98m6-VoX~V0NbEJoC2gtHQ6oCjHPFL~eYnqTSebtSlgOm4n7yK-OT1Xn28hKCffwvfsaB4OkU4VG0KI~PiAoCUnzahbrMSID3a5Br204P6WmhQ~Og0--SwjJu1ff4j4auoyi-lhSmpHuy7l6ciZaFeMcu9SAORKlNE7H0LvPjl3n28qjGm4n~xyI-wyyqALh7F0YA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                        "https://s3-alpha-sig.figma.com/img/3722/2e3d/e587a2104f0a3ed8c5cbab0c0e766481?Expires=1654473600&Signature=LHCGHS3EhO9MH1cB2ELiWTvedIL1mV~BGS5XUYmgxP-sPZCP0w~9AOhwNodpxTsVDpMFDcGylQA5Dpam0X4lLjjth2wK3Ym~YIaXWkXGaYv00Ljtf732DCrH9i~KpXGVTbtHjUDzDWKyZFgqC5DDGtd0KSScwFgBqC8-T2ZAB0HBnbbGkIFOlAYOcgxk9Qjp9xflFkxhfdReeELupbPaBBWLvePk6TQumm1i68b78y4OQEdXwmIa1rfd~qFZ41s9JHw9ZR3MEhERFILOYUKC0lGkjMhP5CrXH41SUP8bSgLmHXG8bh6H-zt5a7os5Dyr~IJLE~A4-mPLyrMbce152w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
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
                            "https://s3-alpha-sig.figma.com/img/ac3d/dfb4/bdaf779c9ea32975413fab92807f2f7d?Expires=1654473600&Signature=g64xHYnc71ne~PpqKr5QGhdg837zgau3YS1KhGa8xXriyl28BQ1EPlcRw-PRtVcP9uQTSL8RRjQBnDS771zycHWCDALf9Y6-BJ-UxAm6o7pH5gquxic6CZhC8u0tZAwC6moJB-4tSGKVROg3T4uurs63v7PI0d~gxXLdergyCdfw~Z76bNQ8VTg2QgcHK4vC3zd7MJLAALgih4c6lxaLyuKzfDPxFWG9udjF3XHKj5ULbM0VS9QYUB9JS-LuvoIJDacpMyScFPwqALO3QcRrSoK-Nxn2iXTbAY5V9~H7~hazlvaHYoKb4XsaeVgtphjHIPH5g0Vmn~VffIH0ikZ9PQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
                            color: Colors.white,
                          ),
                          onTap: () {
                            lerDados();
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bomboniere()));

                             */
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
