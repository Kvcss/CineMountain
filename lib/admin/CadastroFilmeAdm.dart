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
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.blue,
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
                  ),
                  SizedBox(
                    height: _screenHeight * .018,
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      color: Colors.red,
                      height: _screenHeight * .07,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: TextField(
                          //controller: _controllerSenha,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(3, 0, 0, 0),
                              hintText: "Nome do Filme:",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          color: Colors.green,
                          height: _screenHeight * .08,
                          width: _screenHeight * .25,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              //controller: _controllerSenha,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                  hintText: "Data de Lançamento:",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 65,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          color: Colors.green,
                          height: _screenHeight * .08,
                          width: _screenHeight * .15,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              //controller: _controllerSenha,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                  hintText: "Duração:",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          color: Colors.green,
                          height: _screenHeight * .08,
                          width: _screenHeight * .25,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              //controller: _controllerSenha,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                  hintText: "Data de Lançamento:",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 65,
                      ),
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          color: Colors.green,
                          height: _screenHeight * .08,
                          width: _screenHeight * .15,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              //controller: _controllerSenha,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                  hintText: "Duração:",
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          color: Colors.green,
                          height: _screenHeight * .25,
                          width: _screenHeight * .30,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxHeight: 70,
                              ),
                              child: TextField(
                                maxLines: 15,
                                //controller: _controllerSenha,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        5, 30, 15, 30),
                                    hintText: "Sinopse:",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                 const SizedBox(
                   height: 10,
                 ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 0, bottom: 10),
                        child: RaisedButton(
                          child: const Text(
                            "Imagem",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: Colors.pink,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          onPressed: () {
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
