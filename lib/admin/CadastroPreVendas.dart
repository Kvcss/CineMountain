import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
class CadastroPreVendas extends StatefulWidget {
  const CadastroPreVendas({Key? key}) : super(key: key);

  @override
  State<CadastroPreVendas> createState() => _CadastroPreVendasState();
}

class _CadastroPreVendasState extends State<CadastroPreVendas> {
  final Map <dynamic, dynamic> listaNome = Map();
  final dropValue = ValueNotifier('');


  associarArray()async{
    await Firebase.initializeApp();
    var collection = FirebaseFirestore.instance.collection('Filmes');
    var result = await collection.get();
    int cont = 0;
    for(var doc in result.docs){
      listaNome[cont] = doc['Nome do Filme'];
      cont = cont +1;
    }
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
                  Center(
                    child: ValueListenableBuilder(
                      valueListenable: dropValue, builder: (BuildContext context,String value,_) {
                        return DropdownButton<String>(
                          hint: const Text('Selecione o Filme'),
                          value: (value.isEmpty)? null : value,
                          onChanged: (escolha)=> dropValue.value = escolha.toString(),
                          items: listaNome
                              .map(
                                (op)=>DropdownMenuItem(
                                value: op,
                                  child: Text(op),
                                ),
                          )
                            .toList(),

                        );
                    }),
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
