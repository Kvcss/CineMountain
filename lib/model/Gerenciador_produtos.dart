import 'package:cloud_firestore/cloud_firestore.dart';

class GerenciadorProduto {

  GerenciadorProduto(){
    _carregarTodosProdutos();
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> _carregarTodosProdutos() async {
    final QuerySnapshot snapProducts = await firestore.collection('produtos').get(); // Pegamos todos produtos da coleção

    for(DocumentSnapshot doc in snapProducts.docs){
      print(doc.data);
    }
  }
}