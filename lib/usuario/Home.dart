
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Widgets/my_dots_app.dart';
import 'package:projetointegrado_e/Widgets/page_view_app.dart';
import 'Bomboniere.dart';
import 'EmCartaz.dart';
import 'EmPreVenda.dart';
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
                           "https://s3-alpha-sig.figma.com/img/9990/e495/e624738c061210e2222c71f23dc82bce?Expires=1655683200&Signature=GzHHwMZnJCcLINq~P1dDUXMMg311ZSjJ9xbPRwKV3JEHEzSn4LY-Gy7OLLom7WXlhLCe8ldPQfbdX5K2vrSIovkf2eH1Nk3Qg9oHAmXTDdBGY3U3lMg-0-rLpJ0epDDRny9hCu-elB28uLuop2TPf7V~89Fbs5gru1Dg7sgOkWybdLYcJJVCGQn715f0yjpQ4Gi~VGhACo~kt5EYq0Y34aldKk72Jfa~7T59-6ilsCuN8sRdfJxMfsZ4~178eniHeT4WqYi9lV2ZLML0NKEZ6WRRoITC1TYC-myQugQu2PL5VxLkQ2IQQZ8DoNJnQPtYXdJ98fWhkb70RAoKmEyOxw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
                      ),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmPreVenda()));
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
                          "https://s3-alpha-sig.figma.com/img/9a26/26af/3a7b91d31c7f62151fec0276790f0ba2?Expires=1655683200&Signature=QQk3H2Fyu0mPJ0iYOsTgxwjNcY3Sn4GapVOWsxxB1Z-C64fmti2dPc6XJocw1N3~QZNYkb5KBDg5HdbviNIZGl6~-mvf49JTtblVCJjSWno6xg0jJ11uboHqp2S8E5Y95eGiBr-eJUPdFS2MfsG0fJaj-nJi8XIz55hP~NXhl2w1~bTnK~p--FJ88-lFui-nXFOsqJSUp6vbQjjg4DxlPDLx4hgCQsy9xj1hvkPrNAJoFcg6sPKK-ecd9N7uLSGHmKGU-SYZ2duLWueTTt-7RzMEnIztReXpc53qp4wssS-fn2d0V3xvUl0An0drBQMTY6~vm8G0ljnrF7LT7r6X1w__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA"),
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
                        "https://s3-alpha-sig.figma.com/img/3722/2e3d/e587a2104f0a3ed8c5cbab0c0e766481?Expires=1655683200&Signature=Driq50Abw~fZi-HOJibRjQWTOVbeQWEd6lSZ2ZgjTO1dLieAAfT6KLdAHyVKzFrdzzEcv8FprnfOhrHtAZcrewXzWqyeFeuXYx21LgYQw-Av4pU8o1H2P8wRDKbW~3xyOZN9OmijoU0sK6QBnV5Nf37-ivrahusgXbr5fGI40zK1xLFgCHAmUgYdSdcOBY5ZQlWaQHFqzktF884HRtaWkxJe8gMWPLdHcPhy~v9S~sFgS0fJHYSAsCg6u-Jy~mkMO~oKELiOmH8n0NHGVSNocEggRy-SP052utsNssokX85O~0Kk3h8qU3VHOFHp9vOkwT8mQra4B~iNt6f905pNFw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
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
                            "https://s3-alpha-sig.figma.com/img/ac3d/dfb4/bdaf779c9ea32975413fab92807f2f7d?Expires=1655683200&Signature=KjdJW~Tkqnt06zHHsPwtJ9sqn6~nPXXhd3g1f4~EtrxCq0mGumTnVV1DIaSIySCWUhzGaQMOBtwhg1s9mVV22TmVkl588UEMonOSBJynN0I5WsilqMeg4QqKbOggkMOUN6rllKEyduKEy39Hiwg33pCHaSLL~CY7H74nAPUyoy15K2CgGq9wQFsP9qXt9b1riD7IXHKW-6VJ6jM7Ge5veeERC0IlFPtp2UJ39Jc3INJeSv8zSPSR4FmOhNnT8wCShAZq4~nfdgXvWBSNexx052BXRwQy0PQpyw83ADxx9VxKTGvAbGKCFylN5M5wi2uSpvvWnGHlgzg54u1DzzY55g__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
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
