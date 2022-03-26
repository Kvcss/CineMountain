
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/Cadastro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff000000)),
        padding: EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  "imagens/CineMountain-Logo.png",
                  width: 500,
                  height: 350,
                ),
              ), Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text("Bem vindo ao", style: TextStyle(
                    color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold
                ),),
              ),
          Padding(
            padding: EdgeInsets.only(bottom: 40,left: 35),
            child: Text(" entreterimento!🎬", style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold
            ),),
          ),

              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Senha:",
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16, bottom: 10),
                child: RaisedButton(
                  child: Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.pink,
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                  ),
                  onPressed: () {},
                ),
              ),
              Center(
                child: GestureDetector(
                  child: Text("Não tem uma conta?",
                  style: TextStyle(
                    color : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold

                  )
                  ),
                  onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder:(context) => Cadastro()

                        )
                      );
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
