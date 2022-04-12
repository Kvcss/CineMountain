import 'package:flutter/material.dart';
import 'package:projetointegrado_e/admin/HomeAdm.dart';
import 'package:projetointegrado_e/usuario/Cadastro.dart';
import 'package:projetointegrado_e/usuario/Home.dart';
import 'package:projetointegrado_e/model/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";
  _validarCampos() {
    //recuperar os dados dos campos
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    if(email.isNotEmpty && email.contains("adm@gmail.com")){
      if(senha.isNotEmpty && senha.contains("adm12345")){
        _validarCamposAdm(email, senha);
      }
    }else {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty) {
          setState(() {
            _mensagemErro = "";
          });
          Usuario usuario = Usuario();
          usuario.email = email;
          usuario.senha = senha;
          _logarUsuario(usuario);
        } else {
          setState(() {
            _mensagemErro = "Preencha a Senha! Digite mais de 6 caracteres";
          });
        }
      } else {
        setState(() {
          _mensagemErro = "Preencha o E-mail utilizando @";
        });
      }
    }
  }
    _logarUsuario(Usuario usuario) {
      FirebaseAuth auth = FirebaseAuth.instance;
      auth.signInWithEmailAndPassword(
          email: usuario.email,
          password: usuario.senha
      ).then((firebaseUser){
        Navigator.push(context, MaterialPageRoute(builder:(contex)=> Home()));
      }).catchError((error){
        setState(() {
          _mensagemErro = "Erro ao autenticar usuário, verifique seus dados!";
        });
      });
    }
    _logarUsuarioAdm(Usuario usuario){
        FirebaseAuth auth = FirebaseAuth.instance;
        auth.signInWithEmailAndPassword(
            email: usuario.email,
            password: usuario.senha
        ).then((firebaseUser){
          Navigator.push(context, MaterialPageRoute(builder:(contex)=> HomeAdm()));
        }).catchError((error){
          setState(() {
            _mensagemErro = "Erro ao autenticar usuário, verifique seus dados!";
          });
        });
      }
    _validarCamposAdm(String email, String senha) {
      if (email.isNotEmpty && email.contains("adm@gmail.com")) {
        if (senha.isNotEmpty && senha.contains("adm12345")) {
          setState(() {
            _mensagemErro = "";
          });
          Usuario usuario = Usuario();
          usuario.email = email;
          usuario.senha = senha;
          _logarUsuarioAdm(usuario);
        }
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xff000000)),
        padding: const EdgeInsets.all(16),
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  "imagens/CineMountain-Logo.png",
                  width: 500,
                  height: 350,
                ),
              ), const Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text("Bem vindo ao", style: TextStyle(
                    color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold
                ),),
              ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40,left: 35),
            child: Text(" entreterimento!🎬", style: TextStyle(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold
            ),),
          ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _controllerEmail,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "E-mail:",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ),
              TextField(
                controller: _controllerSenha,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: const TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                    hintText: "Senha:",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 10),
                child: RaisedButton(
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.pink,
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)
                  ),
                  onPressed: () {
                    _validarCampos();
                  },
                ),
              ),
              Center(
                child: GestureDetector(
                  child: const Text("Não tem uma conta?",
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
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Center(
                  child:Text(
                      _mensagemErro, style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20)
                  ),
                ) ,
              )
            ],
          ),
        )),
      ),
    );
  }
  }

