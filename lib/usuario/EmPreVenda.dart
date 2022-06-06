

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
import 'package:projetointegrado_e/model/Sec.dart';

import 'EscolhaPreVenda.dart';
import 'EscolhaSessao.dart';


class EmPreVenda extends StatefulWidget {
  const EmPreVenda({Key? key}) : super(key: key);

  @override
  State<EmPreVenda> createState() => _EmPreVenda();
}

class _EmPreVenda extends State<EmPreVenda> {
  Filmes getFilme = Filmes();
  Partes getSessao = Partes();

  verificaSessao()async{
    var collection = FirebaseFirestore.instance.collection('Sessao');
    var result = await collection.get();
    for(var doc in result.docs){
      if(doc['Nome do Filme: ']){
        // print('ola');
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title:const Text('      Em Pre Venda 🎬',style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white),),
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Em Pre Venda').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((documents){


                return GestureDetector(
                  child: Container(
                    height: 160,
                    width: 100,
                    color: Colors.black,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 130,
                          width: 120,
                          color: Colors.black,
                          child: Image.network(documents['Image'],),
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                                child: Text(documents['Nome do Filme'], style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),)
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Center(
                              child: Text('Gênero: '+documents['Genero'], style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                              ),),
                            ),
                            Center(
                              child:  Text('Data Lançamento: '+documents['Data Lancamento'], style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12
                              ),),
                            )

                          ],
                        )
                      ],
                    )
                    ,
                  ),
                  onTap: (){
                    setState(() {
                      getFilme.NomeDoFilme = documents['Nome do Filme'];
                      getFilme.Genero = documents ['Genero'];
                      getFilme.Duracao = documents ['Duracao'];
                      getFilme.Sinopse = documents ['Sinopse'];
                      getFilme.Url = documents ['Image'];

                    });
                    //  print(getFilme);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EscolhaPreVenda(getFilme)));
                  }
                  ,
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
