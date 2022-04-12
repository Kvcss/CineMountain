import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projetointegrado_e/usuario/Login.dart';
import 'package:projetointegrado_e/model/Usuario.dart';



class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  String _mensagemErro = "";
  _validarCampos() {
    //recuperar os dados dos campos
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length > 6) {
          setState(() {
            _mensagemErro = "";
          });
          Usuario usuario = Usuario();
          usuario.nome = nome;
          usuario.email = email;
          usuario.senha = senha;
          _cadastrarUsuario(usuario);
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
    } else {
      setState(() {
        _mensagemErro = "Preencha o Nome";
      });
    }
  }
    _cadastrarUsuario(Usuario usuario)async{

      FirebaseAuth auth = FirebaseAuth.instance;
      auth.createUserWithEmailAndPassword(
          email: usuario.email,
          password: usuario.senha
      ).then((firebaseUser){
       Navigator.push(context, MaterialPageRoute(builder:(contex)=> Login()));
      }).catchError((error){
          setState(() {
            _mensagemErro = "Erro ao cadastrar usuário, verifique os campos e tente novamente";
          });
      });

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro"),
          backgroundColor:  Colors.black,
        ),
        body:  Container(
          decoration: const BoxDecoration(color: Color(0xff000000)),
          padding: const EdgeInsets.all(16),
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(45, 20, 0, 20),
                      child: Text("Bora criar uma conta ?", style: TextStyle(
                          color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold
                      ),),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextField(
                        controller: _controllerNome,
                        autofocus: true,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "Nome: ",
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TextField(
                        controller: _controllerEmail,
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
                          "Cadastrar ",
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
                      child:Text(
                          _mensagemErro, style: const TextStyle(
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
