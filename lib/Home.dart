import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Widgets/card_app.dart';
import 'package:projetointegrado_e/Widgets/home_aux.dart';
import 'package:projetointegrado_e/Widgets/my_dots_app.dart';
import 'package:projetointegrado_e/Widgets/page_view_app.dart';

import 'Bomboniere.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          HomeAux(),
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
                  SizedBox(
                    width: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://s3-alpha-sig.figma.com/img/9990/e495/e624738c061210e2222c71f23dc82bce?Expires=1649635200&Signature=GJmHmEK~12xrea2EEQ61UaxYqFVng3gK4ZfkT5I~kn5IYosvBBHk7wNW4-TSK5hNnVdhGyCq-yzKmyPpH7ek~o~-yQu4FmyBNskQWt8bXoo3v3wu4cvGvdtxybqekSn4zM1dSmSNe4lbPHhfcxjjgaphmhk3ODS8~bJ2r8KsnpMJNdWrmtHDG-OgTljFcNmWQapI1FIPySleDsBcoqsYECrl2tGMm~Znjd~9BXtk-ABwKcU~~iKlNmibFeMMRharRFOKUEpAXN0VnXegi3XL3VG5Sgfg8Krtls~1aPZ879qoyp8JXdUkRFzhB3WO7O5xpo5c6uXkPudDZYMrxPPlWw__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                            height: 100,
                          ),
                        ],
                      ),
                      width: 110,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'https://s3-alpha-sig.figma.com/img/9a26/26af/3a7b91d31c7f62151fec0276790f0ba2?Expires=1649635200&Signature=AQUAZNlV-JurmCVp-HfuSABPqIf9KBdk5AZ2yyp-Ht9J-UhU72H8ht7UG2wcIKgwXfF-IpKP4UYgQecGiCICHnCqpREE6XRiV7AJC5Zpsq6Vxo3IY38wsaLwmEECssXyf-DnqYafaGj1GziMsggBmYUnOQXGQyBBNO49W2lC9jsLWlV03qsQ0P4OUp3mDf2qAsO3J-KX2LUbhYbWldkoWzy-8sYcZ6qoz9UC~wn9TtKOaSTlu~tALDW1E5aJe5wnpMoPpsfcpGyb9DmAtYVNYGQ2GKdZxA8JldAQDN1gLJTakXAwI7u6~Hg-Q2vIVw1pw0P4RG66eoimRcVNcUo-FA__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                            height: 100,
                          ),
                        ],
                      ),
                      width: 110,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 110,
            left: 0,
            right:0,
            height: 51,
            child: Container(
              height: 1,
              color: Colors.black,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 70),
                    child: Text('Pré-Compra', style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 55),
                    child: Text('Em cartaz', style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            )
          ),
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
                  SizedBox(
                    width: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.network(
                           'https://s3-alpha-sig.figma.com/img/3722/2e3d/e587a2104f0a3ed8c5cbab0c0e766481?Expires=1649635200&Signature=FAQPSzUHftute7pU4czxkn3NZ1wlx55tXrZOkuBJsBBYG7XaJCmGYXBaLYfNl3AeZixQQlyGqbvMJvGyENOLDRls6sVtk9KMMrfJgFWEFAuKge~UY-h1NKWNiS4055A524yjKx8IGr3BecwrsfdUVl-lDd1kLnOvMouL1CrlNSLM5iZcDWALMn7heWmY-jhpwS86fwlC7~nedIjGauTuc77lsyFFe1m1WMlFGWIWUgAmsi3zpAtoNR4-7h1lI-LYXZ5iR7r141VZApzHTZYmFumwnndHc2dnCDVdJeTkWthAe2DEnzBXPbo24cJ-fntA52Yv9O2waqhdDFrgynDFbg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                            height: 45, color: Colors.white,
                          ),
                        ],
                      ),
                      width: 60,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Image.network('https://cdn.discordapp.com/attachments/891605575975190589/958171706692866058/Design_sem_nome__3_-removebg-preview_1.png',
                          height: 50,
                          ),
                        ],
                      ),
                      width: 60,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Padding(

                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child:GestureDetector(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Image.network('https://s3-alpha-sig.figma.com/img/ac3d/dfb4/bdaf779c9ea32975413fab92807f2f7d?Expires=1649635200&Signature=U8d3NFM3vsJ06X9fjiRS-SKblRf8xypO9X~0E-UMKM6KG42LaMq8z1NeNguPsy4T3gMKotR9PUp034FH4~oBgb2ZQp2cgoExrbkCOh2HXhAt8ltWzcOE2B0YlY4xKYf73Q-FPrzXe6hsNwU3~t9OguajLmUukauODkWdE5Hhw5NbHeGj~~v2x8-Ul9kS5UlXD-va0YtgRGHn55pgK41EM-Q6i0XIrfOdIIVI3c9YHKW~AtvU5iazNqmzcfQ9V8xJseIJNXKusDiaEZ~Hk-lN80zYfK-T9bOWuRCaUaYbOqAuzp1ZhniVAuZVvg3Ts184GR7ZjAHT9zd2tjHRE8aEZg__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA',
                              height: 45, color: Colors.white,
                            ),
                          ],
                        ),
                        width: 60,
                        color: Colors.black,
                      ),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(context) => Bomboniere())
                        );
                      },
                    ),
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
