import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:model/Gerenciador_produtos.dart';

class Bomboniere extends StatefulWidget {
  const Bomboniere({Key? key}) : super(key: key);

  @override
  State<Bomboniere> createState() => _BomboniereState();
}

class _BomboniereState extends State<Bomboniere> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Bomboniere', style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.black,
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
        ),
        child: Container(
          width: 150,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              AspectRatio(aspectRatio: 1,
                child: Image.network('https://www.google.com/imgres?imgurl=http%3A%2F%2Fpainel.menudigital.app.br%2Ffiles%2F59062020011853846115445.jpg&imgrefurl=https%3A%2F%2Fwww.cinepolis.me%2F&tbnid=V3G6_PmgGEMNbM&vet=12ahUKEwjUjbit1o33AhXdqJUCHew3AIIQMygHegUIARDNAQ..i&docid=cNgrsQfVDbZQCM&w=1000&h=1000&q=combo%20pipoca&ved=2ahUKEwjUjbit1o33AhXdqJUCHew3AIIQMygHegUIARDNAQ')
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    /*
                    Text(
                      nome do item
                    )
                     */
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ); // Item builder é para apresentar o
  }
}
