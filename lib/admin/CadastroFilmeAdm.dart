import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'dart:io';
class CadastroFilme extends StatefulWidget {

  const CadastroFilme({Key? key}) : super(key: key);

  @override
  State<CadastroFilme> createState() => _CadastroFilmeState();
}

class _CadastroFilmeState extends State<CadastroFilme> {
 final TextEditingController _controllerNomeFilme = TextEditingController();
 final TextEditingController _controllerDataLancamento = TextEditingController();
 final TextEditingController _controllerDuracao = TextEditingController();
 final TextEditingController _controllerRestricaoIdade = TextEditingController();
 final TextEditingController _controllerGenero = TextEditingController();
 final TextEditingController _controllerSinopse = TextEditingController();
 String Url = "";
 String _mensagemErro ="";
 String UrlBebidas="";
 String UrlDoces="";
 String UrlPipocas = "";
 String UrlCombo = "";


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
 validarCadastro(){
   String NomeFilme = _controllerNomeFilme.text;
   String DataDeLancamento = _controllerDataLancamento.text;
   String Duracao = _controllerDuracao.text;
   String RestricaoIdade = _controllerRestricaoIdade.text;
   String Genero = _controllerGenero.text;
   String Sinopse = _controllerSinopse.text;
   String _Url = Url;

   if(NomeFilme.isNotEmpty){
     if(DataDeLancamento.isNotEmpty){
       if(Duracao.isNotEmpty){
         if(RestricaoIdade.isNotEmpty){
           if(Genero.isNotEmpty){
             if(Sinopse.isNotEmpty){
               setState(() {
                 _mensagemErro = "";
               });
               uploadFile();
               Filmes filme = Filmes();
               filme.NomeDoFilme = NomeFilme;
               filme.DataLancamento = DataDeLancamento;
               filme.Duracao = Duracao;
               filme.RestricaoDeIdade = RestricaoIdade;
               filme.Genero = Genero;
               filme.Sinopse = Sinopse;
               filme.Url = _Url;
               _AdicionarFilme(filme);
             }else{
               setState(() {
                 _mensagemErro = 'Insira uma sinopse';
               });
             }
           }else{
             setState(() {
               _mensagemErro = 'Insira um genero';
             });
           }
         }else{
           setState(() {
             _mensagemErro = 'Insira uma restrição de idade ';
           });
         }
       }else{
         setState(() {
           _mensagemErro = 'Insira uma Duração';
         });
       }
     }else{
       setState(() {
         _mensagemErro = 'Insira uma data de lançamento';
       });
     }
   }else{
     setState(() {
       _mensagemErro = 'Insira o nome do filme';
     });
   }
 }
 _AdicionarFilme(Filmes filme) async {
  await Firebase.initializeApp();
  var collection = FirebaseFirestore.instance.collection("Filmes");
  collection.doc().set(
    {
      'Nome do Filme': filme.NomeDoFilme,
      'Data Lancamento' : filme.DataLancamento,
      'Duracao': filme.Duracao,
      'Restrição de idade': filme.RestricaoDeIdade,
      'Genero': filme.Genero,
      'Sinopse': filme.Sinopse,
      'Image': filme.Url,
    }
  );

 }

  PlatformFile? pickedFile;
  Future uploadFile()async{
    final path = 'files/my-image2.jpg';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    Url = (await ref.getDownloadURL()).toString();

  }
  Future selectFile() async{
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }
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
                      color: Colors.black,
                      height: _screenHeight * .07,
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: TextField(
                          controller: _controllerNomeFilme,
                          keyboardType: TextInputType.text,
                          style: const TextStyle(fontSize: 16),
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
                          color: Colors.black,
                          height: _screenHeight * .08,
                          width: _screenHeight * .25,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              controller: _controllerDataLancamento,
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
                          color: Colors.black,
                          height: _screenHeight * .08,
                          width: _screenHeight * .15,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              controller: _controllerDuracao,
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
                const  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          color: Colors.black,
                          height: _screenHeight * .08,
                          width: _screenHeight * .25,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              controller: _controllerRestricaoIdade,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                  hintText: "Restrição de Idade:",
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
                          color: Colors.black,
                          height: _screenHeight * .08,
                          width: _screenHeight * .15,
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: TextField(
                              controller: _controllerGenero,
                              keyboardType: TextInputType.text,
                              style: const TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                  hintText: "Genero:",
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
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: Container(
                          color: Colors.black,
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
                                controller: _controllerSinopse,
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
                            selectFile();
                          },
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0),
                        child: RaisedButton(
                          child: const Text(
                            "           Cadastrar           ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: Colors.pink,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          onPressed: () {
                            validarCadastro();
                          },
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_mensagemErro, style: TextStyle(color: Colors.red,fontSize:20,fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
