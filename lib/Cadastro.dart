
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";
  _validarCampos(){
    //recuperar os dados dos campos
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    if (nome.isNotEmpty){
      if(email.isNotEmpty && email.contains("@")){
        if(senha.isNotEmpty){
          setState(() {
            _mensagemErro = "";
          });
        }else{
          setState(() {
            _mensagemErro = "Preencha a Senha";
          });
        }
      }else{
        setState(() {
          _mensagemErro = "Preencha o E-mail utilizando @";
        });
      }

    }else{
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }
    _cadastrarUsuario(){
      FirebaseAuth auth = FirebaseAuth.instance;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
          backgroundColor:  Colors.black,
        ),
        body:  Container(
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
                        "imagens/CineMountain-Cadastro.png",
                        width: 200,
                        height: 150,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(45, 20, 0, 20),
                      child: Text("Bora criar uma conta ?", style: TextStyle(
                          color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold
                      ),),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TextField(
                        controller: _controllerNome,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "Nome",
                            filled: true,
                            fillColor: Colors.grey,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: TextField(
                        controller: _controllerEmail,
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
                      controller: _controllerSenha,
                      obscureText: true,
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
                          "Cadastrar",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.pink,
                        padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)
                        ),
                        onPressed: () {
                          _validarCampos();
                        },
                      ),
                    ),
                    Center(
                      child:Text(
                          _mensagemErro, style: TextStyle(
                          color: Colors.red,
                          fontSize: 20)
                      ),
                    )
                  ],
                ),
              )),
        ),
    );
  }
}
