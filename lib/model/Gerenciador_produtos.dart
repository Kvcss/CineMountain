import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:projetointegrado_e/model/Produtos.dart';

class GerenciadorProduto extends ChangeNotifier {

  GerenciadorProduto(){
    _carregarTodosProdutos();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Produto> _todosProdutos = []; // Declaração de lista privada do tipo produtos

  Future<void> _carregarTodosProdutos() async {
    final QuerySnapshot snapProducts = await firestore.collection('produtos').get(); // Pega todos produtos da coleção

    // Pega cada um dos documentos, coloca na variavel "d", transformando documento em um Produto, depois transf em uma lista
    _todosProdutos = snapProducts.documents.map(
            (d) => Produto.fromDocument(d)).toList();

    // Notificar que lista foi modificada
    notifyListeners();
  }
}