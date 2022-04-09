import 'package:flutter/material.dart';

class CadastroFilme extends StatefulWidget {
  const CadastroFilme({Key? key}) : super(key: key);

  @override
  State<CadastroFilme> createState() => _CadastroFilmeState();
}

class _CadastroFilmeState extends State<CadastroFilme> {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
                            "Cadastro de",
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
                        Text(
                          "Filmes",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: _screenHeight*.50,
            left: 35,
            child: Container(

            ),
          )

        ],
      ),
    );
  }
}
