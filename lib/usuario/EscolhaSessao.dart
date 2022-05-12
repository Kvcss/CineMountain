

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Filmes.dart';
class EscolhaSessao extends StatefulWidget {
  Filmes getFilme = Filmes();


  EscolhaSessao(this.getFilme,{Key? key}) : super(key: key);
  @override
  State<EscolhaSessao> createState() => _EscolhaSessaoState();
}

class _EscolhaSessaoState extends State<EscolhaSessao> {


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("           " + widget.getFilme.NomeDoFilme.toString(), style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                  height: 20,
              ),
              Container(
                height: 200,
                width: 400,
                color: Colors.black,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 170,
                      width: 130,
                      color: Colors.black,
                      child: Image.network(widget.getFilme.Url.toString()),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Text(widget.getFilme.NomeDoFilme.toString(), style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17,
                          )) ,
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: Row(
                            children: [
                              Text("Gênero: "+widget.getFilme.Genero.toString(), style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12,
                              )),
                             const SizedBox(
                                width: 10,
                              ),
                              Text("Duração: "+widget.getFilme.Duracao.toString(), style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 12,
                              )),
                            ],
                          ) ,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,
                          width: 150,
                          color: Colors.black,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text("Sinopse: "+widget.getFilme.Sinopse.toString(), style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                            )),
                          ),

                        )
                      ],
                    )
                  ],

                ),
              )
            ],
          ),
        )

    ),
    );
}
}