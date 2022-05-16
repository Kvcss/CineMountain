
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../model/PreVendas.dart';
class CadastroPreVendas extends StatefulWidget {
  const CadastroPreVendas({Key? key}) : super(key: key);

  @override
  State<CadastroPreVendas> createState() => _CadastroPreVendasState();
}

class _CadastroPreVendasState extends State<CadastroPreVendas> {
  final TextEditingController _controllerDataLancamento = TextEditingController();
  final TextEditingController _controllerHorario = TextEditingController();
  final TextEditingController _controllerSala = TextEditingController();
 // final dropValue = ValueNotifier('');
  List<String> ListaNome = [];
   String? valorEscolido;

   getPrevenda()async {

   }
   validarCadastro(){
     String DataDeLancamento = _controllerDataLancamento.text;
     String Horario = _controllerHorario.text;
     String Sala = _controllerSala.text;
      String NomeDoFime = valorEscolido!;
     PreVenda preVenda = PreVenda();
     preVenda.NomeDoFilme = NomeDoFime;
     preVenda.Sala = Sala;
     preVenda.Horario = Horario;
     preVenda.DataLancamento = DataDeLancamento;
     _adicionarPreVendas(preVenda);
   }
   _adicionarPreVendas(PreVenda preVenda)async{
     await Firebase.initializeApp();
     var collection = FirebaseFirestore.instance.collection("Pre vendas");
     collection.doc().set(
         {
           'Nome do Filme': preVenda.NomeDoFilme,
           'Data' : preVenda.DataLancamento,
           'Sala': preVenda.Sala,
           'Horario': preVenda.Horario,
         }
     );
   }
   Future associarArray()async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('Filmes');
    var result = await collection.get();
    for(var doc in result.docs){
      ListaNome.add(doc['Nome do Filme']);
    }

  }
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: associarArray(),
        initialData: "Aguardando os dados....",
        builder: (context, snapshot) {
          return Container(
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
                      ),
                     const SizedBox(
                        height: 20,
                      ),
                     /*
                     Container(
                       height: 60,
                       width: 260,
                       color: Colors.white,
                       child: Center(
                         child: ValueListenableBuilder(
                           valueListenable: dropValue, builder: (BuildContext context, String value,_){
                             return SizedBox(
                               width: 280,
                               child: DropdownButtonFormField<String>(
                                 isExpanded: true,
                                 hint: const Text('Selecione o filme:', style: TextStyle(color: Colors.black),),
                                 decoration: InputDecoration(
                                   fillColor: Colors.white,
                                   border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),

                                   )
                                 ),
                                 value: (value.isEmpty)? null: value,
                                 onChanged: (escolha)=> dropValue.value = escolha.toString(),
                                 items: ListaNome.map((opcao)=>DropdownMenuItem(

                                     child: Text(opcao, style: TextStyle(color: Colors.black),),
                                    value: opcao,
                                 ),).toList(),
                               ),
                             );
                         }),
                       ),
                     ),
                     */
                      Container(
                        height : 50,
                        width: 250,
                        color: Colors.white,
                        child: Center(
                          child: DropdownButton<String>(
                            // hint: Text('Selecione o nome do Filme',style: TextStyle(color: Colors.black)),
                            dropdownColor: Colors.white,

                            hint: Text('Selecione o filme', style: TextStyle(color: Colors.black),),
                            style: TextStyle(color: Colors.white),
                            items: ListaNome.map(buildMenuItem).toList(),
                            onChanged: (value)=> setState(() => valorEscolido = value),
                          ),

                        ),
                      ),
              /*
                     Container(
                        height: 60,
                        width: 240,
                        color: Colors.white,
                        child: Center(
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                                ),
                              ),
                              hint: const Text('Selecione o nome do Filme',style: TextStyle(color: Colors.black)),
                             // hint: Text('Selecione o filme', style: TextStyle(color: Colors.white),),
                              dropdownColor: Colors.white,
                              style: TextStyle(color: Colors.black),
                              //value: valorEscolido,
                              items: ListaNome.map(buildMenuItem).toList(),
                              onChanged: (value)=> setState(() => this.valorEscolido = value),
                            ),

                        ),
                      ),
                  */
                  /*  Container(
                      height: 60,
                      width: 260,
                      color: Colors.white,
                      child: Center(
                        child: DropdownButton(
                          hint: const Text('Selecione o Filme'),
                          value: valorEscolido!,
                          onChanged: (newValue){
                            setState(() {
                              valorEscolido = newValue as String?;
                            });
                          },
                          items: ListaNome.map((valorEscolido){
                            return DropdownMenuItem(
                              child: Text(valorEscolido),
                              value: valorEscolido
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                   */
                    const  SizedBox(
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
                               controller: _controllerDataLancamento,
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
                       const   SizedBox(
                            width: 90,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 0),
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
                  const    SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            color: Colors.black,
                            height: _screenHeight * .08,
                            width: _screenHeight * .15,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: TextField(
                                 controller: _controllerSala,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                    contentPadding:
                                    const EdgeInsets.fromLTRB(5, 15, 15, 15),
                                    hintText: "Sala:",
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10))),
                              ),
                            ),
                          ),
                        ),
                      ),
                  const    SizedBox(
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
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        }
      ),
    );

  }
  DropdownMenuItem<String> buildMenuItem(String listaNome) =>
      DropdownMenuItem(
        value: listaNome,
        child: Text(
          listaNome,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),

      );

}
