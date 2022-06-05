



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/admin/HomeAdm.dart';


import '../model/Sec.dart';
class Sessao extends StatefulWidget {
  List<String> listaNome;
  List<String> listaSala;
  Sessao(this.listaNome,this.listaSala,{Key? key}) : super(key: key);

  @override
  State<Sessao> createState() => _SessaoState();
}

class _SessaoState extends State<Sessao> {
  final TextEditingController _controllerData = TextEditingController();
  final TextEditingController _controllerHorario = TextEditingController();
  final TextEditingController _controllerSala = TextEditingController();
  String _mensagemErro = '';
  validavalida(Partes sessao){

  }
  validaPreVenda(Partes sessao)async{
    /*var collection = FirebaseFirestore.instance.collection('Pre vendas');
    var result = await collection.get();
    int aux = 0;
    _mensagemErro = '';
    for(var doc in result.docs){
      if((sessao.NomeDoFilme == doc['Nome do Filme: '] )&&( sessao.Sala == doc['Sala: ']) && (sessao.DataLancamento == doc['Data: '] )&& (sessao.Horario == doc['Horario: '])){
        setState(() {
          _mensagemErro = 'Já tem uma Pré venda deste Filme';
          aux ++;
        });
      }

    }

     */
   // _adicionarPreVendas(sessao);

  }
  //final dropValue = ValueNotifier('');
  //List<String> ListaNome = [];
  String? valorEscolido;
  String? valorEscolidoSala;
  validarCadastro(){
    String DataDeLancamento = _controllerData.text;
    String Horario = _controllerHorario.text;
    String Sala = valorEscolidoSala!;
    //a
    String NomeDoFime = valorEscolido!;
    Partes sessao = Partes();
    sessao.DataLancamento = DataDeLancamento;
    sessao.Horario = Horario;
    sessao.Sala = Sala;
    sessao.NomeDoFilme = NomeDoFime;
    _adicionarPreVendas(sessao);
  }
  _adicionarPreVendas(Partes sessao)async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection("Sessao");
    collection.doc().set(
        {
          'Data: ' : sessao.DataLancamento,
          'Horario: ': sessao.Horario,
          'Nome do Filme: ': sessao.NomeDoFilme,
          'Sala: ': sessao.Sala,

        }
    );
    Navigator.push(context, MaterialPageRoute(
        builder: (contex) => HomeAdm()));
  }
  Future associarArray()async{
   /* await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('Filmes');
    var result = await collection.get();
    for(var doc in result.docs){
      ListaNome.add(doc['Nome do Filme']);
    }

    */

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
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(right: 0),
                                    child: Text(
                                      "Cadastro de ",
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
                                      "Sessao",
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height : 50,
                          width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          child: Center(
                            child: DropdownButton<String>(

                              // hint: Text('Selecione o nome do Filme',style: TextStyle(color: Colors.black)),
                              dropdownColor: Colors.white,
                              value: valorEscolido,
                              hint: const Center(child:Text('Selecione o filme', style: TextStyle(color: Colors.black,fontSize: 15),),),
                              style: TextStyle(color: Colors.white),
                              items: widget.listaNome.map(buildMenuItem).toList(),
                              onChanged: (value)=> setState(() => valorEscolido = value),
                            ),

                          ),
                        ),

                       const SizedBox(
                          height: 20,
                        ),
                        Row(
                            children : <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Container(
                                  color: Colors.black,
                                  height: _screenHeight * .08,
                                  width: _screenHeight * .15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: TextField(
                                      controller: _controllerData,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(fontSize: 15),
                                      decoration: InputDecoration(
                                          contentPadding:
                                          const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                          hintText: "Data:",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10))),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: Container(
                                  color: Colors.black,
                                  height: _screenHeight * .08,
                                  width: _screenHeight * .15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: TextField(
                                      controller: _controllerHorario,
                                      keyboardType: TextInputType.text,
                                      style: const TextStyle(fontSize: 15),
                                      decoration: InputDecoration(
                                          contentPadding:
                                          const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                          hintText: "Horario:",
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10))),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                       const  SizedBox(
                          height: 40,
                        ),
                        Center(
                          child:  Container(
                            height : 50,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: DropdownButton<String>(

                                // hint: Text('Selecione o nome do Filme',style: TextStyle(color: Colors.black)),
                                dropdownColor: Colors.white,
                                value: valorEscolidoSala,
                                hint: const Center(child:Text('Selecione a sala', style: TextStyle(color: Colors.black,fontSize: 15),),),
                                style: TextStyle(color: Colors.white),
                                items: widget.listaSala.map(buildMenuItem).toList(),
                                onChanged: (value)=> setState(() => valorEscolidoSala = value),
                              ),

                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                        ),

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
                        ),
                        Center(
                          child: Text(_mensagemErro,style: TextStyle(color: Colors.red, fontSize: 80, fontWeight: FontWeight.bold),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

    );

  }
  DropdownMenuItem<String> buildMenuItem(String listaNome) =>
      DropdownMenuItem(
        value: listaNome,
        child: Text(
          listaNome,
          style: const TextStyle( fontSize: 15, color: Colors.black),
        ),

      );
  DropdownMenuItem<String> buildMenuItemSala(String listaSala) =>
      DropdownMenuItem(
        value: listaSala,
        child: Text(
          listaSala,
          style: const TextStyle( fontSize: 15, color: Colors.black),
        ),

      );

}

