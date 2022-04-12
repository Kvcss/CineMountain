import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projetointegrado_e/model/Produto.dart';


class Produto {

  Produto.FromDocument(DocumentSnapshot document){
    id = document.documentID;
    nome = document['name'] as String;
    descricao = document['descricao'] as String;
    // Do firebase retorna uma lista dinamica e preciso de uma lista de strings
    imagens = List<String>.from(document.data['imagem'] as List<dynamic>);
  }

  String id;
  String nome;
  String descricao;
  List<String> imagens;
}