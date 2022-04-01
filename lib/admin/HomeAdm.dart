import 'dart:ui';

import 'package:flutter/material.dart';

class HomeAdm extends StatefulWidget {
  const HomeAdm({Key? key}) : super(key: key);

  @override
  State<HomeAdm> createState() => _HomeAdmState();
}

class _HomeAdmState extends State<HomeAdm> {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Column(
            children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Container(
                  color: Colors.red,
                  height: _screenHeight * .10,
                  child:
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
                )
            ],
          ),
          Positioned(
            top: _screenHeight*.15,
            height: _screenHeight,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  height: _screenHeight * .10 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Cinemount')
                    ],
                  ),

                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
