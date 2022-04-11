import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/Gerenciador_produtos.dart';
import 'package:projetointegrado_e/model/Produtos_ListTile.dart';
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
      body: Consumer<GerenciadorProduto>(
          builder: (_, gerenciadorProduto, __){
            return ListView.builder(
              itemCount: gerenciadorProduto.todosProdutos.lenght, // verificar pq nao esta roxo todosProdutos.lenght
              itemBuilder: (_, index){
                return ProdutoListTile(GerenciadorProduto.todosProdutos[index]); // todosProdutos nao esta roxo
              }
            );
          },
        ), // Aqui era pra ser consumer, declarar corretamente
      ); // Item builder é para apresentar o
    }
  }
