import 'package:cloud_firestore/cloud_firestore.dart';

class ProductManager {
    ProductManager(){
    loadAllProducts();
  }
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void >loadAllProducts() async{
   final QuerySnapshot snapProducts =
   await firestore.collection('Filmes').get();

   for(DocumentSnapshot doc in snapProducts.docs){
     print(doc.data());
   }
  }
}