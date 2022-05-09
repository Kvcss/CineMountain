import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projetointegrado_e/model/product_manager.dart';
import 'package:provider/provider.dart';

class EmCartaz extends StatefulWidget {
  const EmCartaz({Key? key}) : super(key: key);

  @override
  State<EmCartaz> createState() => _EmCartazState();
}

class _EmCartazState extends State<EmCartaz> {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    Future<void >loadAllProducts() async{
      final QuerySnapshot snapProducts =
      await firestore.collection('Filmes').get();

      for(DocumentSnapshot doc in snapProducts.docs){
        print(doc.data());
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadAllProducts(),
        initialData: 'Aguardadando os dados...',
        builder: (context, snapshot){
          return Container(
          );
        },
      ),
    );
  }
}
