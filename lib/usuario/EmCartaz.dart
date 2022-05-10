

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class EmCartaz extends StatefulWidget {
  const EmCartaz({Key? key}) : super(key: key);

  @override
  State<EmCartaz> createState() => _EmCartazState();
}

class _EmCartazState extends State<EmCartaz> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title:const Text('      Em Cartaz 🎬',style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white),),
          backgroundColor: Colors.black,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Filmes').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
            if(!snapshot.hasData){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((documents ){
                return Container(
                  height: 160,
                  width: 100,
                  color: Colors.black,
                  child: Row(
                    children: [
                      SizedBox(
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
                                child: Text(documents['Nome do Filme'], style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),)
                              ),
                              SizedBox(
                                height: 40,
                              ),
                             Center(
                               child: Text('Gênero: '+documents['Genero'], style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.bold,
                                   fontSize: 12
                               ),),
                             ),
                          Center(
                            child: Text('Data Lançamento: '+documents['Data Lancamento'], style: TextStyle(
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
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
