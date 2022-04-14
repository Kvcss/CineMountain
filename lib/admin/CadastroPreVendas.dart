import 'package:flutter/material.dart';
class CadastroPreVendas extends StatefulWidget {
  const CadastroPreVendas({Key? key}) : super(key: key);

  @override
  State<CadastroPreVendas> createState() => _CadastroPreVendasState();
}

class _CadastroPreVendasState extends State<CadastroPreVendas> {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                "Cadastro de Pré",
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
                            Padding(
                              padding: EdgeInsets.only(right: 0),
                              child: Text(
                                "Venda",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}
